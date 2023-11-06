class LoginResponseModel {
  LoginResponseModel({
    this.userLoginAPI,
  });

  LoginResponseModel.fromJson(dynamic json) {
    userLoginAPI = json['UserLoginAPI'] != null
        ? UserLoginApi.fromJson(json['UserLoginAPI'])
        : null;
  }

  UserLoginApi? userLoginAPI;
}

class UserLoginApi {
  UserLoginApi({
    this.errorCode,
    this.result,
    this.response,
  });

  UserLoginApi.fromJson(dynamic json) {
    errorCode = json['ErrorCode'];
    result = json['Result'];
    if (json['Response'] != null) {
      response = [];
      json['Response'].forEach((v) {
        response?.add(UserResponse.fromJson(v));
      });
    }
  }

  String? errorCode;
  String? result;
  List<UserResponse>? response;
}

class UserResponse {
  UserResponse({
    this.userID,
    this.userName,
    this.designation,
    this.mobileNo,
    this.memberType,
    this.firmName,
    this.dateOfBirth,
    this.dateOfAnniversary,
    this.language,
    this.address,
    this.option,
    this.captchaCode,
    this.oTPCode,
    this.profileImage,
  });

  UserResponse.fromJson(dynamic json) {
    userID = json['UserID'];
    userName = json['UserName'];
    designation = json['Designation'];
    mobileNo = json['MobileNo'];
    memberType = json['MemberType'];
    firmName = json['FirmName'];
    dateOfBirth = json['DateOfBirth'];
    dateOfAnniversary = json['DateOfAnniversary'];
    language = json['Language'];
    address = json['Address'];
    option = json['Option'];
    captchaCode = json['CaptchaCode'];
    oTPCode = json['OTPCode'];
    profileImage = json['ProfileImage'];
  }

  String? userID;
  String? userName;
  String? designation;
  String? mobileNo;
  String? memberType;
  String? firmName;
  String? dateOfBirth;
  String? dateOfAnniversary;
  String? language;
  String? address;
  String? option;
  String? captchaCode;
  String? oTPCode;
  String? profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['UserName'] = userName;
    map['Designation'] = designation;
    map['MobileNo'] = mobileNo;
    map['MemberType'] = memberType;
    map['FirmName'] = firmName;
    map['DateOfBirth'] = dateOfBirth;
    map['DateOfAnniversary'] = dateOfAnniversary;
    map['Language'] = language;
    map['Address'] = address;
    map['Option'] = option;
    map['CaptchaCode'] = captchaCode;
    map['OTPCode'] = oTPCode;
    map['ProfileImage'] = profileImage;
    return map;
  }
}
