import 'package:bloc/bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/home_event.dart';
import 'package:markon_project/bloc%20Architecture/state/home_state.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/login_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
   RestApi api = new RestApi();
  SharedDB db = new SharedDB();
  Login? log;

  HomeBloc() : super(InitialHomeState()) {
    on<HomeEvent>((event, emit) async {
   try {
  //log = await db.getUser();
      if (event is GetProfile) {
        emit(GetProfileLoading());
        await Future.delayed(Duration(milliseconds: 100));
        emit(ProfileLoaded(log!));
      }
      else if (event is DoLogout) {
        emit(LogoutLoading());
        LoginReq logout = new LoginReq();
        logout.userCode = log?.userCode;
        logout.userPasswd = log?.userPasswd;
        await api.logout(logout.toJson(), log!.url!);
        //await db.dbClear();
        emit(HomeLogout());
      }
     
   } catch (e) {

     emit(HomeError(e.toString()));
     
   }
    });
  }
}
