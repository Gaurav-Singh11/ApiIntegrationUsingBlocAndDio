import 'dart:async';
import 'dart:convert';

import 'package:netcarrots_task/src/business_layer/network/api_constants.dart';
import 'package:netcarrots_task/src/business_layer/network/app_network.dart';
import 'package:netcarrots_task/src/business_layer/network/exception_type.dart';
import 'package:netcarrots_task/src/business_layer/network/http_request_methods.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/log_helper.dart';
import 'package:netcarrots_task/src/data_layer/models/base_api_response_model.dart';
import 'package:netcarrots_task/src/data_layer/models/response_models/login_response_model.dart';
import 'package:netcarrots_task/src/data_layer/models/request_model/login_request_model.dart';

/// The [AuthRepository] class handles login and user details for your app.
class AuthRepository {
  /// Private constructor for singleton
  AuthRepository._privateConstructor();

  /// Singleton instance creation
  static final _instance = AuthRepository._privateConstructor();

  /// Get the singleton instance
  static AuthRepository get instance => _instance;

  /// A private tag used for logging within the [AuthRepository] class.
  final String _tag = "AuthRepository: ";

  /// Methode used calls the login API and returns the parsed response data.
  ///
  /// This method calls the login API, sends the [request] as JSON data,
  /// and returns the response data as a [BaseApiResponseModel]. If the request
  /// is successful, it contains the parsed response data. If an exception
  /// occurs, it includes the exception type.
  /// Parameters:
  ///   - [request]: An instance of [LoginRequestModel] containing the login request data.
  /// Returns: A [Future] of [BaseApiResponseModel] representing the API response.
  Future<BaseApiResponseModel> login(LoginRequestModel? request) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstants.login,
        requestType: HttpRequestMethods.post,
        request: request?.toJson(),
      );
      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        final responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        return BaseApiResponseModel(
          data: LoginResponseModel.fromJson(responseBody!),
        );
      } else {
        return BaseApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return BaseApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }
}
