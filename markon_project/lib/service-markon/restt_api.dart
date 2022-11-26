import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:markon_project/helper/constant.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/model/login_response_model.dart';
import 'package:markon_project/model/signup_model.dart';
import 'package:markon_project/service-markon/api_url.dart';
import 'package:markon_project/service-markon/net_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RestApi extends ApiUrl {
  NetworkUtil net = new NetworkUtil();
  Login? log;
  SharedDB db = new SharedDB();

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('companyId');
  }

  // Future<SearchSOResult> searchData(
  //     Map<String, dynamic> body, String token, String url) {
  //   return net
  //       .post(url + ApiConstants.Search_Data_SO,
  //           headers: {
  //             'Accept': 'application/json',
  //             'Content-Type': 'application/json',
  //             'Authorization': token
  //           },
  //           body: body,
  //           encoding: Encoding.getByName('utf-8'),
  //           param: {})
  //       .then(
  //     (dynamic res) {
  //       print(res);
  //       if (res["errMsg"] != null) throw (res["errMsg"].toString());
  //       return SearchSOResult.fromJson(res);
  //     },
  //   );
  // }

  Future<LoginResponse> login(Map<String, dynamic> body) {
    return net
        .post(baseUrl + '/signIn',
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: body,
            encoding: Encoding.getByName('utf-8'),
            param: {})
        .then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return LoginResponse.fromJson(res);
      },
    );
  }

  Future<Login> logout(Map<String, dynamic> body, String url) {
    return net
        .post(url + ApiConstants.LogOut,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: body,
            encoding: Encoding.getByName('utf-8'),
            param: {})
        .then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return Login.fromJson(res);
      },
    );
  }

  Future<Login> refreshToken(Map<String, dynamic> body, String url) {
    return net
        .post(url + ApiConstants.RefreshToken,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: body,
            encoding: Encoding.getByName('utf-8'),
            param: {})
        .then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return Login.fromJson(res);
      },
    );
  }

  // Future<dynamic> uploadImageTest(String token, File file, String url) {
  //   return net.multipartOneFile(
  //       'POST', url + ApiConstants.Search_Data_Inq_Preparation,
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //         'Authorization': token,
  //       },
  //       param: {}).then(
  //     (dynamic res) {
  //       print(res);
  //       if (res["errMsg"] != null) throw (res["errMsg"].toString());
  //       return (res);
  //     },
  //   );
  // }

  // Future<dynamic> uploadImageSales(filepath, String url) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(url + ApiConstants.Upload_Gambar_Sales));

  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     'Accept': 'text/plain',
  //   });

  //   request.files.add(http.MultipartFile('file',
  //       File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
  //       filename: filepath.split("/").last));
  //   var res = await request.send();

  //   return res;
  // }

  // Future<dynamic> uploadImageDelivery(filepath, String url) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(url + ApiConstants.Upload_Gambar_Delivery));

  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     'Accept': 'text/plain',
  //   });

  //   request.files.add(http.MultipartFile('file',
  //       File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
  //       filename: filepath.split("/").last));
  //   var res = await request.send();

  //   return res;
  // }

  Future<dynamic> uploadImageDelivery(filepath, String url) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(url + ApiConstants.Upload_Gambar_Delivery));

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'text/plain',
    });

    request.files.add(http.MultipartFile('file',
        File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
        filename: filepath.split("/").last));
    var res = await request.send();

    return res;
  }

  Future<dynamic> uploadFileFrans(filepath, String url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    final encodedStr = filepath;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".xlsx");
    await file.writeAsBytes(bytes);
    print(file.path);

    request.files.add(http.MultipartFile('file',
        File(file.path).readAsBytes().asStream(), File(file.path).lengthSync(),
        filename: (file.path).split("/").last));
    var res = await request.send();

    return res;
  }

  Future<SignUpResponseHeader> signup(Map<String, dynamic> body) {
    return net
        .post(baseUrl + "/signUp",
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: body,
            encoding: Encoding.getByName('utf-8'),
            param: {})
        .then(
      (dynamic res) {
        print(res);
        if (res["errMsg"] != null) throw (res["errMsg"].toString());
        return SignUpResponseHeader.fromJson(res);
      },
    );
  }
}
