import 'package:flutter/material.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';

class WellScreen extends StatefulWidget {
  const WellScreen({super.key});

  @override
  State<WellScreen> createState() => _WellScreenState();
}

class _WellScreenState extends State<WellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.deviceHeight(1),
        width: context.deviceWidth(1),
        color: MarkonBlue,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.deviceHeight(0.13),
                left: context.deviceWidth(0.25),
                right: context.deviceWidth(0.1)),
            child: Image.asset('assets/image/cloud.png'),
          ),
          Padding(
            padding: EdgeInsets.all(context.deviceHeight(0.16)),
            child: Image.asset('assets/image/Logo Mobile.png'),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: context.deviceHeight(0.3),
              right: context.deviceWidth(0.0099),
              left: context.deviceWidth(0.00123),
            ),
            child: Container(
                width: context.deviceWidth(1),
                child: Image.asset(
                  'assets/image/cuate.png',
                  fit: BoxFit.fitWidth,
                )),
          ),

          //),
          Positioned(
              top: context.deviceHeight(0.64),
              left: context.deviceWidth(0.03),
              child: Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: context.deviceHeight(0.04027),
                    fontWeight: FontWeight.w800),
              )),

          Positioned(
              top: context.deviceHeight(0.72),
              left: context.deviceWidth(0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOREM IPSUM DOLOR SIT AMET,',
                    style: TextStyle(
                        fontSize: context.scaleFont(12),
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'CONSECTETUR ADIPISCING ELIT ',
                    style: TextStyle(
                        fontSize: context.scaleFont(12),
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: context.deviceHeight(0.0525641)),
                  Padding(
                    padding: EdgeInsets.only(
                      right: context.deviceWidth(0.0099),
                      left: context.deviceWidth(0.00123),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: context.deviceWidth(0.058)),
                        CustomButtonWithFreeColor(
                          widthrectang: 3.0,
                          colorRectang: Colors.black,
                          buttonHeight: context.deviceHeight(0.08),
                          buttonWidth: context.deviceWidth(0.35),
                          radius: context.deviceHeight(0.4),
                          title: 'SIGN UP',
                          fontSizel: context.scaleFont(19),
                          color: MarkonBlue,
                          textColor: Colors.black,
                          onTap: () {},
                        ),
                        SizedBox(width: context.deviceWidth(0.10)),
                        CustomButtonWithFreeColor(
                          widthrectang: 3.0,
                          colorRectang: Colors.black,
                          buttonHeight: context.deviceHeight(0.08),
                          buttonWidth: context.deviceWidth(0.35),
                          radius: context.deviceHeight(0.4),
                          fontSizel: context.scaleFont(19),
                          title: 'SIGN IN',
                          color: Colors.black,
                          textColor: Colors.white,
                          onTap: () {},
                        ),
                        SizedBox(width: context.deviceWidth(0.058)),
                      ],
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
