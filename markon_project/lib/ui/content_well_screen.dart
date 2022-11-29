import 'package:flutter/material.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';
import 'package:markon_project/ui/sign_in/modalbottom_required._signin.dart';
import 'package:markon_project/ui/signup/signup_ui.dart';

class Content_Welcome_Screen extends StatelessWidget {
  const Content_Welcome_Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
            top: context.deviceHeight(0.1),
            left: context.deviceWidth(0.25),
            right: context.deviceWidth(0.193461)),
        child: Image.asset('assets/image/cloud.png'),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: context.deviceHeight(0.1375),
          right: context.deviceWidth(0.33888),
          left: context.deviceWidth(0.33888),
        ),
        child: Container(
            height: context.deviceHeight(0.05),
            width: context.deviceWidth(0.32222),
            child:
                Image.asset('assets/image/Logo Mobile.png', fit: BoxFit.fill)),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: context.deviceHeight(0.32375),
          right: context.deviceWidth(0.0111111111111111),
          left: context.deviceWidth(0.0103888888888889),
          bottom: context.deviceHeight(0.3918125),
        ),
        child: Container(
            height: context.deviceHeight(0.5),
            width: context.deviceWidth(1),
            child: Image.asset(
              'assets/image/cuate.png',
              fit: BoxFit.fitWidth,
            )),
      ),
      Positioned(
          top: context.deviceHeight(0.660675),
          left: context.deviceWidth(0.0555555555555556),
          right: context.deviceWidth(0.5555),
          child: Container(
            height: context.deviceHeight(0.03625),
            width: context.deviceWidth(0.4244444444444444),
            child: Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: context.deviceHeight(0.03325),
                  fontWeight: FontWeight.w800),
            ),
          )),
      Positioned(
          top: context.deviceHeight(0.726925),
          left: context.deviceWidth(0.0555555555555556),
          right: context.deviceWidth(0.0555555555555556),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONNECT WITH EACH OTHER',
                style: TextStyle(
                    fontSize: context.scaleFont(12),
                    fontWeight: FontWeight.w300),
              ),
              Text(
                'ENJOY YOUR MARKET!',
                style: TextStyle(
                    fontSize: context.scaleFont(12),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: context.deviceHeight(0.04)),
              Padding(
                padding: EdgeInsets.only(
                  right: context.deviceWidth(0.01805555555555556),
                  left: context.deviceWidth(0.02105555555555556),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonWithFreeColor(
                      widthrectang: 3.0,
                      colorRectang: Markongold,
                      buttonHeight: context.deviceHeight(0.06375),
                      buttonWidth: context.deviceWidth(0.3416666666666667),
                      radius: 10,
                      title: 'Sign up',
                      fontWeight: FontWeight.w500,
                      fontSizel: context.scaleFont(18),
                      color: MarkonBlue,
                      textColor: Colors.black,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                            builder: (BuildContext context) {
                              return SignUpblc();
                            });
                      },
                    ),
                    SizedBox(width: context.deviceWidth(0.1055555555555556)),
                    CustomButtonWithFreeColor(
                      widthrectang: 3.0,
                      colorRectang: Markongold,
                      buttonHeight: context.deviceHeight(0.06375),
                      buttonWidth: context.deviceWidth(0.3416666666666667),
                      radius: 10,
                      fontWeight: FontWeight.w500,
                      fontSizel: context.scaleFont(18),
                      title: 'Sign in',
                      color: Markongold,
                      textColor: Colors.black,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                          builder: (BuildContext context) {
                            return NeedLogin(mode: 'SIGNIN');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    ]);
  }
}
