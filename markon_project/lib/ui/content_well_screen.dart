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
import 'package:markon_project/ui/pop_up_verif/pop_up_verif.dart';
import 'package:markon_project/ui/sign_in/modalbottom_required._signin.dart';

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
          //bottom: context.deviceHeight(0.233075),
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
  final FocusNode phone = FocusNode();

  //final ScrollController scrollController = ScrollController();
  final scrollController = ScrollController(initialScrollOffset: 50);
  bool obsecure = true;
  bool obsecure1 = true;
  final key = GlobalKey<FormState>();
  String url = 'http://192.168.100.116:8086/markont/signUp';

  @override
  void initState() {
    final FocusNode phone = FocusNode();

    phone.addListener(
        () => print('focusNode updated: hasFocus: ${phone.hasFocus}'));
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(phone);
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
          return showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: true,
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            builder: (BuildContext context) {
              //return NeedLogin(mode: 'SIGNIN');
              return Verifpop();
            },
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
          height: context.deviceHeight(0.76),
          child: RawScrollbar(
            controller: scrollController,
            thumbVisibility: true,
            thickness: 3,
            thumbColor: Colors.transparent,
            radius: const Radius.circular(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: scrollController,
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
                      Text(
                        'BACK',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: context.deviceHeight(0.045),
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
                      fillColor: TrustPostLightGrey300,
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
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: TrustPostLightGrey300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: TrustPostLightGrey300)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: TrustPostLightGrey300),
                        borderRadius: BorderRadius.circular(4),
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
                      fillColor: TrustPostLightGrey300,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecure1 = !obsecure1;
                          });
                        },
                        child: Icon(
                          obsecure1 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'Re-Type Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: TrustPostLightGrey300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: TrustPostLightGrey300)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: TrustPostLightGrey300),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    obscureText: obsecure1,
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
                    inputAction: TextInputAction.done,
                    focusNode: phone,
                    onTap: () => setFocus(),
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
                          buttonHeight: context.deviceHeight(0.0625),
                          buttonWidth: context.deviceWidth(0.25),
                          radius: 10,
                          title: 'Sign Up',
                          fontWeight: FontWeight.w700,
                          fontSizel: context.scaleFont(12),
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
                        SizedBox(height: context.deviceHeight(0.01)),
                        Text(
                          'Or Sign up with',
                          style: TextStyle(fontSize: context.scaleFont(10)),
                        ),
                        SizedBox(height: context.deviceHeight(0.01)),
                        GestureDetector(
                          child: Image.asset(
                            'assets/image/google.png',
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: context.deviceHeight(0.2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
