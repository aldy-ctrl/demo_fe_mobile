import 'package:flutter/material.dart';
import 'package:markon_project/helper/custom_textfield.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/ui/home/home_ui.dart';

class ModContain extends StatefulWidget {
  final String? mode;
  const ModContain({super.key, this.mode});

  @override
  State<ModContain> createState() => _ModContainState();
}

class _ModContainState extends State<ModContain> {
  TextEditingController usernameCo = TextEditingController();
  TextEditingController passwordCo = TextEditingController();
  bool obsecure = true;
  int count = 2;
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Container(
        padding: EdgeInsets.only(
            left: context.deviceWidth(0.0555555555555556),
            right: context.deviceWidth(0.0555555555555556),
            top: context.deviceHeight(0.02)),
        height: context.deviceHeight(1),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: (() {
                      widget.mode == 'SIGNIN'
                          ? Navigator.pop(context)
                          : Navigator.of(context).popUntil((_) => count-- <= 0);
                    }),
                  ),
                  Text(
                    'BACK',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: context.deviceHeight(0.045),
              ),
              CustomFormTextField(
                  hint: 'USERNAME',
                  controller: usernameCo,
                  maxLength: 30,
                  inputType: TextInputType.emailAddress,
                  validator: (value) =>
                      isEmail(value!) ? null : 'Check ur email'),
              SizedBox(
                height: context.deviceHeight(0.0125),
              ),
              Visibility(
                visible: widget.mode == 'SIGNIN',
                child: Column(
                  children: [
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
                            borderRadius: BorderRadius.circular((48)),
                            borderSide: BorderSide(color: Colors.black38)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((48)),
                            borderSide: BorderSide(color: Colors.black38)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      obscureText: obsecure,
                      controller: passwordCo,
                      validator: (value) =>
                          //(value!.isEmpty) ? "Silahkan isi password" : null,
                          isEmail(value!) ? null : 'Check ur email',
                    ),
                    //SizedBox(height: context.deviceHeight(0.058)),
                  ],
                ),
              ),
              SizedBox(height: context.deviceHeight(0.058)),
              Center(
                child: Column(
                  children: [
                    CustomButtonWithFreeColor(
                      widthrectang: 2.0,
                      colorRectang: Colors.grey,
                      buttonHeight: context.deviceHeight(0.05875),
                      buttonWidth: context.deviceWidth(0.2777777777777778),
                      radius: 48,
                      title: widget.mode == 'SIGNIN' ? 'SIGN IN' : 'SUBMIT',
                      fontSizel: context.scaleFont(14),
                      color: Colors.white,
                      textColor: Colors.grey,
                      onTap: () {
                        if (key.currentState!.validate()) {
                          widget.mode == 'SIGNIN'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeUI()))
                              : null;
                        }
                      },
                    ),
                    widget.mode == 'SIGNIN'
                        ? SizedBox(
                            height: context.deviceHeight(0.0175),
                          )
                        : SizedBox(
                            height: context.deviceHeight(0.0275),
                          ),
                    Visibility(
                      visible: widget.mode == 'SIGNIN',
                      child: Column(
                        children: [
                          GestureDetector(
                              child: Text(
                                'FORGOT PASSWORD ?',
                                style: TextStyle(color: Colors.grey),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                                  builder: (BuildContext context) {
                                    return ModContain(mode: 'FORGOT');
                                  },
                                );
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
