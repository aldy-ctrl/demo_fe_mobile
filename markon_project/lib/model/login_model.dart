class Login {
  String? status;
  String? message;
  String? token;
  String? refreshToken;
  String? tokenExpDate;
  String? refreshTokenExpDate;
  String? tokenAge;
  String? refreshTokenAge;
  String? roleCode;
  String? companyId;
  String? companyName;
  String? address;

  //helper
  String? userCode;
  String? userPasswd;
  String? url;

  Login({
    this.companyId = '',
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.tokenExpDate,
    this.refreshTokenExpDate,
    this.tokenAge,
    this.refreshTokenAge,
    this.userCode,
    this.userPasswd,
    this.roleCode = '',
    this.companyName = '',
    this.address = '',
    this.url,
  });

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    tokenExpDate = json['tokenExpDate'];
    refreshTokenExpDate = json['refreshTokenExpDate'];
    tokenAge = json['tokenAge'];
    refreshTokenAge = json['refreshTokenAge'];
    roleCode = json['roleCode'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['tokenExpDate'] = this.tokenExpDate;
    data['refreshTokenExpDate'] = this.refreshTokenExpDate;
    data['tokenAge'] = this.tokenAge;
    data['refreshTokenAge'] = this.refreshTokenAge;
    data['roleCode'] = this.roleCode;
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    data['address'] = this.address;
    return data;
  }
}

// class LoginReq {
//   String? userCode;
//   String? userPasswd;

//   String? username;
//   String? password;

//   //helper
//   String? url;

//   LoginReq({this.userCode, this.userPasswd, this.url});

//   LoginReq.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['password'] = this.password;
//     return data;
//   }
// }

class LoginReq {
  String? userCode;
  String? userPasswd;
  String? username;
  String? password;

  //helper
  String? url;

  LoginReq({this.username, this.password, this.userCode, this.userPasswd});

  LoginReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}

class RefreshToken {
  String? refreshToken;
  String? username;

  RefreshToken({this.refreshToken, this.username});

  RefreshToken.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    data['username'] = this.username;
    return data;
  }
}
