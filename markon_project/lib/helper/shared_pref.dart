
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';



class SharedDB {
  // Future saveUser(Login login) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   await prefs.setString(SharedKey.token, login.token.toString());
  //   await prefs.setString(
  //       SharedKey.refreshToken, login.refreshToken.toString());
  //   await prefs.setString(
  //       SharedKey.tokenExpDate, login.tokenExpDate.toString());
  //   await prefs.setString(
  //       SharedKey.refreshTokenExpDate, login.refreshTokenExpDate.toString());
  //   await prefs.setString(SharedKey.tokenAge, login.tokenAge.toString());
  //   await prefs.setString(
  //       SharedKey.refreshTokenAge, login.refreshTokenAge.toString());
  //   //helper
  //   await prefs.setString(SharedKey.userCode, login.userCode.toString());
  //   await prefs.setString(SharedKey.userPass, login.userPasswd.toString());
  //   await prefs.setString(SharedKey.roleCode, login.roleCode.toString());
  //   await prefs.setString(SharedKey.companyId, login.companyId.toString());

  //   await prefs.setString(SharedKey.companyName, login.companyName.toString());
  //   await prefs.setString(SharedKey.address, login.address.toString());
  //   await prefs.setString(SharedKey.url, login.url.toString());
  // }

  // Future<Login> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Login log = new Login();

  //   await checkTokenAge();

  //   log.token = prefs.getString(SharedKey.token);
  //   log.refreshToken = prefs.getString(SharedKey.refreshToken);
  //   log.tokenExpDate = prefs.getString(SharedKey.tokenExpDate);
  //   log.refreshTokenExpDate = prefs.getString(SharedKey.refreshTokenExpDate);
  //   log.tokenAge = prefs.getString(SharedKey.tokenAge);
  //   log.refreshTokenAge = prefs.getString(SharedKey.refreshTokenAge);
  //   log.userCode = prefs.getString(SharedKey.userCode);
  //   log.userPasswd = prefs.getString(SharedKey.userPass);
  //   log.roleCode = prefs.getString(SharedKey.roleCode);
  //   log.companyId = (prefs.getString(SharedKey.companyId));
  //   log.companyName = (prefs.getString(SharedKey.companyName));
  //   log.address = (prefs.getString(SharedKey.address));
  //   log.url = (prefs.getString(SharedKey.url));

  //   return log;
  // }

  // Future dbClear() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  // }

  // Future<void> checkTokenAge() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   RestApi api = new RestApi();

  //   String? exp1 = prefs.getString(SharedKey.tokenExpDate);
  //   String? exp2 = prefs.getString(SharedKey.refreshTokenExpDate);
  //   String? id = prefs.getString(SharedKey.userCode);
  //   String? pass = prefs.getString(SharedKey.userPass);
  //   String? server = prefs.getString(SharedKey.url);

  //   if (exp1 != null && exp2 != null) {
  //     DateTime now = DateTime.now();
  //     DateTime tokenExp = convertDate(exp1, 'dd-MMM-yyyy HH:mm:ss');
  //     DateTime rfTokenExp = convertDate(exp2, 'dd-MMM-yyyy HH:mm:ss');
  //     bool tokenIsExpired = tokenExp.difference(now).inMilliseconds.isNegative;
  //     bool rfTokenIsExp = rfTokenExp.difference(now).inMilliseconds.isNegative;

  //     if (rfTokenIsExp) {
  //       //kondisi dimana refresh token expired
  //       LoginReq log = new LoginReq(); //akses logout
  //       log.userCode = id;
  //       log.userPasswd = pass;
  //       log.url = server;
  //       try {
  //         await api.logout(log.toJson(), log.url!);
  //         await dbClear();
  //         //locator<NavigatorService>().navigateReplaceTo(
  //         //Constant.LOGIN_SCREEN);

  //         //langsung balik ke login screen
  //         locator<NavigatorService>()
  //             .navigateReplaceTo(Constant.SESSION_EXPIRED);
  //       } catch (e) {
  //         //apabila error
  //         throw e.toString(); //menampilkan/ mengarahkan ke pesan error
  //       }
  //     } else if (tokenIsExpired) {
  //       String? rfToken = prefs.getString(SharedKey.refreshToken);
  //       RefreshToken refresh = new RefreshToken();
  //       refresh.username = id;
  //       refresh.refreshToken = rfToken;
  //       try {
  //         Login log1 = await api.refreshToken(refresh.toJson(), server!);
  //         log1.userCode = id;
  //         log1.userPasswd = pass;
  //         log1.url = server;
  //         await saveUser(log1);
  //       } catch (e) {
  //         throw e.toString();
  //       }
  //     }
  //   }
  // }
}
