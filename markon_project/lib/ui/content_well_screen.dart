import 'package:flutter/material.dart';
import 'package:markon_project/helper/custom_textfield.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';

class Content_Welcome_Screen extends StatelessWidget {
  const Content_Welcome_Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          top: context.deviceHeight(0.329),
          right: context.deviceWidth(0.0099),
          left: context.deviceWidth(0.00123),
        ),
        child: Container(
            height: context.deviceHeight(0.5),
            width: context.deviceWidth(1),
            child: Image.asset(
              'assets/image/cuate.png',
              fit: BoxFit.fitWidth,
            )),
      ),

      //),
      Positioned(
          top: context.deviceHeight(0.75),
          left: context.deviceWidth(0.03),
          child: Text(
            'WELCOME',
            style: TextStyle(
                fontSize: context.deviceHeight(0.03327),
                fontWeight: FontWeight.w800),
          )),

      Positioned(
          top: context.deviceHeight(0.8),
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
              SizedBox(height: context.deviceHeight(0.03)),
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
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: context.deviceWidth(0.0236),
                                  right: context.deviceWidth(0.0236),
                                  top: context.deviceHeight(0.010625)),
                              height: context.deviceHeight(1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.arrow_back),
                                        onTap: (() {
                                          Navigator.pop(context);
                                        }),
                                      ),
                                      Text('BACK')
                                    ],
                                  ),
                                  SizedBox(
                                    height: context.deviceHeight(0.0125),
                                  ),
                                  SizedBox(
                                    height: context.deviceHeight(0.03125),
                                    child: CustomFormTextField(
                                      hint: 'USERNAME',
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.deviceHeight(0.0125),
                                  ),
                                  SizedBox(
                                    height: context.deviceHeight(0.03125),
                                    child: CustomFormTextField(
                                      hint: '***********',
                                    ),
                                  ),
                                  SizedBox(height: context.deviceHeight(0.058)),
                                  Center(
                                    child: Column(
                                      children: [
                                        CustomButtonWithFreeColor(
                                          widthrectang: 2.0,
                                          colorRectang: Colors.grey,
                                          buttonHeight:
                                              context.deviceHeight(0.05),
                                          buttonWidth:
                                              context.deviceWidth(0.25),
                                          radius: context.deviceHeight(0.4),
                                          title: 'SIGN IN',
                                          fontSizel: context.scaleFont(14),
                                          color: Colors.white,
                                          textColor: Colors.grey,
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          height: context.deviceHeight(0.0125),
                                        ),
                                        Text(
                                          'FORGOT PASSWORD ?',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: context.deviceWidth(0.058)),
                  ],
                ),
              ),
            ],
          )),
    ]);
  }
}
