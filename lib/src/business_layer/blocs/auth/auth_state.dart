import 'package:netcarrots_task/src/data_layer/models/response_models/login_response_model.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String? captchaCode;
  final String? successMessage;

  LoginSuccessState({
    this.captchaCode,
    this.successMessage,
  });
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState({
    required this.errorMessage,
  });
}

class OtpVerificationSuccessState extends AuthState {
  final UserResponse? loginResponse;
  final String? successMessage;

  OtpVerificationSuccessState({
    this.loginResponse,
    this.successMessage,
  });
}

class OtpVerificationErrorState extends AuthState {
  final String errorMessage;

  OtpVerificationErrorState({
    required this.errorMessage,
  });
}
