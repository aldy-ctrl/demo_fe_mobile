import 'package:bloc/bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/logout_event.dart';
import 'package:markon_project/bloc%20Architecture/state/logout_state.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  RestApi api = new RestApi();
  SharedDB db = new SharedDB();
  LoginReq? log;
  LogoutBloc() : super(InitState()) {
    on<LogoutEvent>((event, emit) async {
      try {
        if (event is CheckLogout) {
          //Login login = await db.getUser();
          // if (login.token != null) {
          //   emit(IsLogoutState());
          // } else {
          //   emit(NotLogoutState());
          // }
        } else if (event is LogoutSubmitted) {
          emit(LogoutInProgress());
          await logout(event.body);
          log?.userCode = event.body.userCode;
          log?.userPasswd = event.body.userPasswd;
          log?.url = event.body.url;
          //await db.saveUser(log);
          //await db.dbClear();
          emit(LogoutSuccess());
        } else {
          if (state is InitState) {}
        }
      } catch (e) {
        emit(LogoutFailed(error: 'Note :' + e.toString()));
      }
    });
  }

  dynamic logout(Login req) async {
    log = (await api.logout(req.toJson(), log!.url!)) as LoginReq;
  }
}
