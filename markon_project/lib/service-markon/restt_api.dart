import 'dart:convert';
import 'package:markon_project/helper/constant.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/service-markon/net_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestApi {
  NetworkUtil net = new NetworkUtil();
  Login? log;
  SharedDB db = new SharedDB();

  String baseUrl = '';

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


Future<Login> login(Map<String, dynamic> body, String url) {
    return net
        .post(url + ApiConstants.Login,
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
}
