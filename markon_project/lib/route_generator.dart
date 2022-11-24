import 'package:flutter/material.dart';
import 'package:markon_project/helper/constant.dart';
import 'package:markon_project/ui/home/home_ui.dart';
import 'package:markon_project/ui/wellcome_ui.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case Constant.MENU_HOME:
        return MaterialPageRoute(builder: (_) => HomeUI());

         case Constant.MENU_DASHBOARD:
        return MaterialPageRoute(builder: (_) => WellScreen());
      // case Constant.FORCE_LOGOUT:
      //   return MaterialPageRoute(builder: (_) => LoginScreenAlternatif());

      // case Constant.MENU_SO_DETAIL:
      //   int args = settings.arguments as int;
      //   return MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(
      //             providers: [
      //               BlocProvider<SoDetailBloc>(
      //                 create: (context) => SoDetailBloc(),
      //               ),
      //             ],
      //             child: SoDetail(
      //               id: args,
      //             ),
      //           ));

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ups, ada sesuatu yang salah. Coba lagi"),
            Container(
              margin: EdgeInsets.all(4),
            ),
            GestureDetector(onTap: () {}, child: Icon(Icons.replay))
          ],
        )),
      );
    });
  }
}
