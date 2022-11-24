class LoginResponse {
  String? status;
  String? messageCode;
  String? message;
  String? processFinishDate;
  LogData? data;

  //HELPER
  String? username;
  String? password;
  String? url;

  LoginResponse(
      {this.status,
      this.messageCode,
      this.message,
      this.processFinishDate,
      this.data,
      this.password,
      this.username,
      this.url});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messageCode = json['messageCode'];
    message = json['message'];
    processFinishDate = json['processFinishDate'];
    data = json['data'] != null ? new LogData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['messageCode'] = this.messageCode;
    data['message'] = this.message;
    data['processFinishDate'] = this.processFinishDate;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LogData {
  String? tokenType;
  String? accessToken;
  String? accessTokenExpDate;
  String? accessTokenAge;

  LogData(
      {this.tokenType,
      this.accessToken,
      this.accessTokenExpDate,
      this.accessTokenAge});

  LogData.fromJson(Map<String, dynamic> json) {
    tokenType = json['tokenType'];
    accessToken = json['accessToken'];
    accessTokenExpDate = json['accessTokenExpDate'];
    accessTokenAge = json['accessTokenAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokenType'] = this.tokenType;
    data['accessToken'] = this.accessToken;
    data['accessTokenExpDate'] = this.accessTokenExpDate;
    data['accessTokenAge'] = this.accessTokenAge;
    return data;
  }
}
