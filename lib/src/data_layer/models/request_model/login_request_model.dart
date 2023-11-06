import 'dart:io';

import 'package:netcarrots_task/src/business_layer/util/helper/device_info_helper.dart';

class LoginRequestModel {
  LoginRequestModel({
    this.mobileNo,
    this.captchaCode,
    this.otp,
  });

  String? mobileNo;
  String? deviceId;
  String? oSType;
  String? captchaCode;
  String? otp;
  String? isLoginFirst;
  String? fCMToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MobileNo'] = mobileNo;
    map['DeviceId'] = DeviceInfo.deviceId;
    map['OSType'] = Platform.isIOS ? "iOS" : "Android";
    map['CaptchaCode'] = captchaCode;
    map['OTP'] = otp;
    map['IsLoginFirst'] = "";
    map['FCMToken'] = "";
    return map;
  }
}
