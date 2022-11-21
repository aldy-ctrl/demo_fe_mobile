import 'package:bloc/bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/login_event.dart';
import 'package:markon_project/bloc%20Architecture/state/login_state.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  RestApi api = new RestApi();
  SharedDB db = new SharedDB();
  Login? log;
  LoginBloc() : super(InitState()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is CheckLogin) {
          //Login login = await db.getUser();
          // if (login.token != null) {
          //   emit(IsLoginState());
          // } else {
          //   emit(NotLoginState());
          // }
        } else if (event is LoginSubmitted) {
          emit(LoginInProgress());
          await logout(event.body, event.url);
          await login(event.body, event.url);

          log?.userCode = event.body.userCode;
          log?.userPasswd = event.body.userPasswd;
          log?.url = event.body.url;
          //await db.saveUser(log!);
          emit(LoginSuccess());
        }
      } catch (e) {
        emit(LoginFailed(error: 'Error' + e.toString()));
      }
    });
  }
  dynamic login(LoginReq req, String url) async {
    log = await api.login(req.toJson(), url);
  }

  dynamic logout(LoginReq req, String url) async {
    log = await api.logout(req.toJson(), url);
  }
}
