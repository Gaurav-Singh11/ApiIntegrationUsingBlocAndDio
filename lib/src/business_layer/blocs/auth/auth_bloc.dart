import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_state.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations.dart';
import 'package:netcarrots_task/src/business_layer/repository/auth_repository.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/util_helper.dart';
import 'package:netcarrots_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:netcarrots_task/src/data_layer/models/request_model/login_request_model.dart';
import 'package:netcarrots_task/src/data_layer/models/response_models/login_response_model.dart';

/// The [AuthBloc] class extends [Cubit<AuthState>] and is responsible for
/// handling authentication-related logic.
class AuthBloc extends Cubit<AuthState> {
  /// Initializes the AuthBloc with an initial state of [InitialState].
  AuthBloc() : super(InitialState());

  /// Performs user login with the provided mobile number.
  /// [mobileNumber] is the user's mobile number for authentication.
  /// Emits [LoadingState] before performing the login operation.
  /// If login is successful, emits [LoginSuccessState] with captcha code
  /// and success message.
  /// If there's an error, emits [LoginErrorState] with an error message.
  Future<void> login({required String mobileNumber}) async {
    if(mobileNumber.isNotEmpty){
      emit(LoadingState());
      LoginRequestModel request = LoginRequestModel(mobileNo: mobileNumber, captchaCode: "", otp: "");
      final response = await AuthRepository.instance.login(request);
      if(response.data != null && response.data is LoginResponseModel){
        LoginResponseModel loginObj = response.data;
        if(loginObj.userLoginAPI != null && loginObj.userLoginAPI!.errorCode == "11" && loginObj.userLoginAPI!.response != null && loginObj.userLoginAPI!.response!.isNotEmpty && loginObj.userLoginAPI!.response!.first.captchaCode != null){
          emit(LoginSuccessState(
            captchaCode: loginObj.userLoginAPI!.response!.first.captchaCode,
            successMessage: loginObj.userLoginAPI?.result,
          ));
        } else {
          emit(LoginErrorState(errorMessage: UtilHelper.instance.getError(loginObj.userLoginAPI?.result)));
        }
      } else {
        emit(LoginErrorState(errorMessage: UtilHelper.instance.getExceptionMessage(response.exceptionType)));
      }
    } else {
      emit(LoginErrorState(errorMessage: AppLocalizations.current.mobileNumberRequired));
    }
  }

  /// Verifies the OTP (One-Time Password) for authentication.
  /// [mobile] is the user's mobile number.
  /// [otp] is the One-Time Password for verification.
  /// [captcha] is the captcha code for the verification.
  /// Emits [LoadingState] before performing the OTP verification.
  /// If OTP verification is successful, emits [OtpVerificationSuccessState]
  /// with user login response and success message.
  Future<void> verifyOtp({required String mobile, required String otp, required String captcha}) async {
    emit(LoadingState());
    LoginRequestModel request = LoginRequestModel(mobileNo: mobile, captchaCode: captcha, otp: otp);
    final response = await AuthRepository.instance.login(request);
    if(response.data != null && response.data is LoginResponseModel){
      LoginResponseModel loginObj = response.data;
      if(loginObj.userLoginAPI != null && loginObj.userLoginAPI!.errorCode == "0" && loginObj.userLoginAPI!.response != null && loginObj.userLoginAPI!.response!.isNotEmpty){
        await UserStateHiveHelper.instance.setLoggedIn();
        await UserStateHiveHelper.instance.setUserResponse(loginObj.userLoginAPI!.response!.first);
        emit(OtpVerificationSuccessState(
          loginResponse: loginObj.userLoginAPI!.response!.first,
          successMessage: loginObj.userLoginAPI?.result,
        ));
      } else {
        emit(OtpVerificationErrorState(errorMessage: UtilHelper.instance.getError(loginObj.userLoginAPI?.result)));
      }
    } else {
      emit(OtpVerificationErrorState(errorMessage: UtilHelper.instance.getExceptionMessage(response.exceptionType)));
    }
  }
}


