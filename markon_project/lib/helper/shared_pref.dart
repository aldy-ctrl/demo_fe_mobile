import 'package:intl/intl.dart';
import 'package:markon_project/helper/constant.dart';
import 'package:markon_project/helper/locator.dart';
import 'package:markon_project/helper/navigator_service.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/model/login_response_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedDB {
  Future saveUser(LoginResponse login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        SharedKey.accessToken, login.data!.accessToken.toString());

    await prefs.setString(
        SharedKey.accesTokenExpDate, login.data!.accessTokenExpDate.toString());

    await prefs.setString(
        SharedKey.accessTokenAge, login.data!.accessTokenAge.toString());
    await prefs.setString(
        SharedKey.tokenType, login.data!.tokenType.toString());
    //helper
    await prefs.setString(SharedKey.username, login.username.toString());
    await prefs.setString(SharedKey.password, login.password.toString());
   
  }

  Future<LoginResponse> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    LoginResponse log = new LoginResponse();

    await checkTokenAge();

    log.data?.accessToken = prefs.getString(SharedKey.accessToken);

    log.data?.accessTokenExpDate = prefs.getString(SharedKey.accesTokenExpDate);

    log.data?.accessTokenAge = prefs.getString(SharedKey.accessTokenAge);

    log.username = prefs.getString(SharedKey.username);
    log.password = prefs.getString(SharedKey.password);



    return log;
  }

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> checkTokenAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    RestApi api = new RestApi();

    String? exp1 = prefs.getString(SharedKey.tokenExpDate);

    String? id = prefs.getString(SharedKey.username);
    String? pass = prefs.getString(SharedKey.password);
   

    if (exp1 != null) {
      DateTime now = DateTime.now();
      DateTime tokenExp = convertDate(exp1, 'dd-MMM-yyyy HH:mm:ss');
      bool tokenIsExpired = tokenExp.difference(now).inMilliseconds.isNegative;
      if (tokenIsExpired) {
        //kondisi dimana  token expired
        LoginReq log = new LoginReq(); //akses logout
        log.username = id;
        log.password = pass;
     
        try {
          await api.logout(log.toJson(), log.url!);
          await dbClear();
          //locator<NavigatorService>().navigateReplaceTo(
          //Constant.LOGIN_SCREEN);

          //langsung balik ke login screen
          locator<NavigatorService>()
              .navigateReplaceTo(Constant.MENU_DASHBOARD);
        } catch (e) {
          //apabila error
          throw e.toString(); //menampilkan/ mengarahkan ke pesan error
        }
      }

      // else if (tokenIsExpired) {
      //   String? rfToken = prefs.getString(SharedKey.refreshToken);
      //   RefreshToken refresh = new RefreshToken();
      //   refresh.username = id;
      //   refresh.refreshToken = rfToken;
      //   try {
      //     Login log1 = await api.refreshToken(refresh.toJson(), server!);
      //     log1.userCode = id;
      //     log1.userPasswd = pass;
      //     log1.url = server;
      //     await saveUser(log1);
      //   } catch (e) {
      //     throw e.toString();
      //   }
      // }
    }
  }
}

DateTime convertDate(String sDate, String format) {
  var formatter = DateFormat(format);
  try {
    //if (sDate != null) {
    int index = format.indexOf('MMM');
    if (index >= 0) {
      String mon = sDate.substring(index, (index + 3));
      String monC = mon.capitalize();
      sDate = sDate.replaceAll(mon, monC);
      print(sDate.replaceAll(mon, monC));
    }
    int i = format.indexOf('MMMM');

    if (i >= 0) {
      String mon = sDate.substring(i, (i + 4));
      String monC = mon.capitalize();
      sDate = sDate.replaceAll(mon, monC);
      print(sDate.replaceAll(mon, monC));
    }
    return formatter.parse(sDate);
    //}
    //return null;
  } catch (e) {
    print(e);
    throw e.toString();
  }
}
