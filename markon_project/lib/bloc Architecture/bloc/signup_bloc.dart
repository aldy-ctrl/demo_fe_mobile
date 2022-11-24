import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/signup_event.dart';
import 'package:markon_project/bloc%20Architecture/state/signup_state.dart';
import 'package:bloc/bloc.dart';
import 'package:markon_project/helper/shared_pref.dart';
import 'package:markon_project/model/signup_model.dart';
import 'package:markon_project/service-markon/restt_api.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  RestApi api = new RestApi();
  SharedDB db = new SharedDB();
  SignUpResponseData? data;
  SignUpResponseHeader result = SignUpResponseHeader();

  SignUpBloc() : super(InitState()) {
    on<SignUpEvent>((event, emit) async {
      try {
        if (event is SignSubmitted) {
          //emit(SignUpInProgress());
          SignUpRequest req = SignUpRequest();
          req = event.body;
          await signup(req, event.url);
          emit(SignUpSuccess(
              succes: 'Succes Sign Up MarConn With Username: ' +
                  req.fullName.toString()));
        }
      } catch (e) {
        emit(SignUpFailed(error: 'ERORR Exception: ' + e.toString()));
      }
    });
  }
  dynamic signup(SignUpRequest req, String url) async {
    result = await api.signup(req.toJson(), url);
  }
}
