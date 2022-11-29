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
  final scrollController = ScrollController(initialScrollOffset: 50);
  bool obsecure = true;
  bool obsecure1 = true;
  final key = GlobalKey<FormState>();

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
            isDismissible: false,
            enableDrag: true,
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            builder: (BuildContext context) {
              //return NeedLogin(mode: 'SIGNIN');
              return Verifpop(email: emailCo.text);
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
          //color: PutihRusak,
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
                    maxLength: 30,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: context.deviceHeight(0.0125),
                  ),
                  CustomFormTextField(
                    hint: 'USERNAME',
                    controller: usernameCo,
                    maxLength: 30,
                    inputType: TextInputType.emailAddress,
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
                      fillColor: MarkonsLightGrey300,
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
                          borderSide: BorderSide(color: MarkonsLightGrey300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: MarkonsLightGrey300)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: MarkonsLightGrey300),
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
                      fillColor: MarkonsLightGrey300,
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
                          borderSide: BorderSide(color: MarkonsLightGrey300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((4)),
                          borderSide: BorderSide(color: MarkonsLightGrey300)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: MarkonsLightGrey300),
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
                        confirmMarconSignUp(),
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

  Widget confirmMarconSignUp() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpInProgress) {
          return Center(
              child: CircularProgressIndicator(
            color: Markongold,
          ));
        } else {
          return CustomButtonWithFreeColor(
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

                bloc(SignSubmitted(body));
              } else {
                null;
              }
            },
          );
        }
      },
    );
  }
}
