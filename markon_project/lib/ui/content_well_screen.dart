import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markon_project/bloc%20Architecture/bloc/signup_bloc.dart';
import 'package:markon_project/bloc%20Architecture/event/signup_event.dart';
import 'package:markon_project/bloc%20Architecture/state/signup_state.dart';
import 'package:markon_project/helper/custom_textfield.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/model/signup_model.dart';

import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';
import 'package:markon_project/ui/sign_in/modalbottom_required._signin.dart';
import 'package:markon_project/ui/wellcome_ui.dart';

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

      //),
      Positioned(
          top: context.deviceHeight(0.660675),
          left: context.deviceWidth(0.0555555555555556),
          right: context.deviceWidth(0.5555),
          child: Container(
            height: context.deviceHeight(0.03625),
            width: context.deviceWidth(0.3944444444444444),
            child: Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: context.deviceHeight(0.03625),
                  fontWeight: FontWeight.w800),
            ),
          )),

      Positioned(
          top: context.deviceHeight(0.726925),
          left: context.deviceWidth(0.0555555555555556),
          right: context.deviceWidth(0.0555555555555556),
          //bottom: context.deviceHeight(0.233075),
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
                      radius: 6,
                      title: 'Sign up',
                      fontSizel: context.scaleFont(19),
                      color: MarkonBlue,
                      textColor: Colors.black,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
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
                      radius: 6,
                      fontSizel: context.scaleFont(19),
                      title: 'Sign in',
                      color: Markongold,
                      textColor: Colors.black,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          enableDrag: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                          builder: (BuildContext context) {
                            return NeedLogin(mode: 'SIGNIN');
                          },
                        );
                      },
                    ),
                    //SizedBox(width: context.deviceWidth(0.058)),
                  ],
                ),
              ),
            ],
          )),
    ]);
  }
}

class SignUpblc extends StatefulWidget {
  const SignUpblc({super.key});

  @override
  State<SignUpblc> createState() => _SignUpblcState();
}

class _SignUpblcState extends State<SignUpblc> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
      ),
    ], child: SignUpBottomSheet());
  }
}

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({
    super.key,
  });

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  TextEditingController fullNameCo = TextEditingController();
  TextEditingController passwordCo = TextEditingController();
  TextEditingController retypePasswordCo = TextEditingController();
  TextEditingController phoneNumberCo = TextEditingController();
  TextEditingController emailCo = TextEditingController();
  TextEditingController usernameCo = TextEditingController();
  TextEditingController phoneCo = TextEditingController();
  bool obsecure = true;
  final key = GlobalKey<FormState>();
  String url = 'http://192.168.100.116:8086/markont/signUp';

  @override
  void initState() {
    super.initState();
  }

  bloc(dynamic event) {
    BlocProvider.of<SignUpBloc>(context).add(event);
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) async {
        // if (condition) {

        // }
        if (state is SignUpSuccess) {
          context.succesSnackBar(state.succes!);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WellScreen()),
          );
        }
        if (state is SignUpFailed) {
          context.failSnackbar(state.error!);
        }
      },
      child: Form(
        key: key,
        child: Container(
          padding: EdgeInsets.only(
              left: context.deviceWidth(0.0555555555555556),
              right: context.deviceWidth(0.0555555555555556),
              top: context.deviceHeight(0.02)),
          height: context.deviceHeight(0.67625),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
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
                  height: context.deviceHeight(0.023125),
                ),
                CustomFormTextField(
                  hint: 'FULL NAME',
                  controller: fullNameCo,
                ),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                CustomFormTextField(
                  hint: 'USERNAME',
                  controller: usernameCo,
                ),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                CustomFormTextField(
                    hint: 'EMAIL',
                    controller: emailCo,
                    maxLength: 30,
                    inputType: TextInputType.emailAddress,
                    validator: (value) => isEmail(value!)
                        ? null
                        : 'Check ur email (must filled and must contain @)'),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                      child: Icon(
                        obsecure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((6)),
                        borderSide: BorderSide(color: Colors.black38)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((6)),
                        borderSide: BorderSide(color: Colors.black38)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  obscureText: obsecure,
                  controller: passwordCo,
                ),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                      child: Icon(
                        obsecure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((6)),
                        borderSide: BorderSide(color: Colors.black38)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((6)),
                        borderSide: BorderSide(color: Colors.black38)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  obscureText: obsecure,
                  controller: retypePasswordCo,
                ),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                CustomFormTextField(
                  hint: 'PHONE NUMBER',
                  controller: phoneCo,
                  formatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  inputType: TextInputType.phone,
                  inputAction: TextInputAction.next,
                  validator: (value) =>
                      value!.isEmpty ? 'Fill ur phone number' : null,
                ),
                SizedBox(
                  height: context.deviceHeight(0.0125),
                ),
                SizedBox(height: context.deviceHeight(0.0225)),
                Center(
                  child: Column(
                    children: [
                      CustomButtonWithFreeColor(
                        widthrectang: 2.0,
                        colorRectang: Markongold,
                        buttonHeight: context.deviceHeight(0.05),
                        buttonWidth: context.deviceWidth(0.25),
                        radius: 6,
                        title: 'Submit',
                        fontSizel: context.scaleFont(14),
                        color: Markongold,
                        textColor: MarkonBluePrimary,
                        onTap: () {
                          if (key.currentState!.validate()) {
                            SignUpRequest body = new SignUpRequest();
                            body.username = usernameCo.text;
                            body.fullName = fullNameCo.text;
                            body.email = emailCo.text;
                            body.mobilePhone = phoneCo.text;
                            body.password = passwordCo.text;
                            body.retypePassword = retypePasswordCo.text;
                            body.url = url;

                            bloc(SignSubmitted(body, url));
                          } else {
                            null;
                          }
                        },
                      ),
                      SizedBox(height: context.deviceHeight(0.02)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
