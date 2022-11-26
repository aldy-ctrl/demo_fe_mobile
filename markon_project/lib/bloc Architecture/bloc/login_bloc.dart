import 'package:bloc/bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/login_event.dart';
import 'package:markon_project/bloc%20Architecture/state/login_state.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/model/login_response_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  RestApi api = new RestApi();
  SharedDB db = new SharedDB();
  LogData? logs;
  LoginResponse result = LoginResponse();
  LoginBloc() : super(InitState()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is CheckLogin) {
          LoginResponse login = await db.getUser();
          if (login.data!.accessToken != null) {
            emit(IsLoginState());
          } else {
            emit(NotLoginState());
          }
        } else if (event is LoginSubmitted) {
          emit(LoginInProgress());
          await login(event.body);

          result.username = event.body.username;
          result.password = event.body.userPasswd;
          
          await db.saveUser(result);
          emit(LoginSuccess());
        }
      } catch (e) {
        emit(LoginFailed(error: 'Error' + e.toString()));
      }
    });
  }
  dynamic login(LoginReq req) async {
    result = await api.login(req.toJson());
  }

  // dynamic logout(LoginReq req, String url) async {
  //   log = await api.logout(req.toJson(), url);
  // }
}
