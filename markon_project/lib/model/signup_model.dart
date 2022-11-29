class SignUpRequest {
  String? email;
  String? fullName;
  String? mobilePhone;
  String? password;
  String? retypePassword;
  String? username;

  //helper
  String? url;

  SignUpRequest(
      {this.email,
      this.fullName,
      this.mobilePhone,
      this.password,
      this.retypePassword,
      this.username});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    mobilePhone = json['mobilePhone'];
    password = json['password'];
    retypePassword = json['retypePassword'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['mobilePhone'] = this.mobilePhone;
    data['password'] = this.password;
    data['retypePassword'] = this.retypePassword;
    data['username'] = this.username;
    return data;
  }
}

class SignUpResponseHeader {
  String? status;
  String? message;
  SignUpResponseData? data;

  SignUpResponseHeader({this.status, this.message, this.data});

  SignUpResponseHeader.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new SignUpResponseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SignUpResponseData {
  String? createdBy;
  String? createdDt;
  dynamic changedBy;
  dynamic changedDt;
  bool? deletedFlag;
  String? username;
  String? fullName;
  String? password;
  String? email;
  String? mobilePhone;
  String? otpRegis;
  bool? flagRegis;
  dynamic otpReset;
  bool? flagReset;
  String? regisTime;
  String? resetTime;

  SignUpResponseData(
      {this.createdBy,
      this.createdDt,
      this.changedBy,
      this.changedDt,
      this.deletedFlag,
      this.username,
      this.fullName,
      this.password,
      this.email,
      this.mobilePhone,
      this.otpRegis,
      this.flagRegis,
      this.otpReset,
      this.flagReset,
      this.regisTime,
      this.resetTime});

  SignUpResponseData.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    createdDt = json['createdDt'];
    changedBy = json['changedBy'];
    changedDt = json['changedDt'];
    deletedFlag = json['deletedFlag'];
    username = json['username'];
    fullName = json['fullName'];
    password = json['password'];
    email = json['email'];
    mobilePhone = json['mobilePhone'];
    otpRegis = json['otpRegis'];
    flagRegis = json['flagRegis'];
    otpReset = json['otpReset'];
    flagReset = json['flagReset'];
    regisTime = json['regisTime'];
    resetTime = json['resetTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['createdDt'] = this.createdDt;
    data['changedBy'] = this.changedBy;
    data['changedDt'] = this.changedDt;
    data['deletedFlag'] = this.deletedFlag;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['mobilePhone'] = this.mobilePhone;
    data['otpRegis'] = this.otpRegis;
    data['flagRegis'] = this.flagRegis;
    data['otpReset'] = this.otpReset;
    data['flagReset'] = this.flagReset;
    data['regisTime'] = this.regisTime;
    data['resetTime'] = this.resetTime;
    return data;
  }
}
