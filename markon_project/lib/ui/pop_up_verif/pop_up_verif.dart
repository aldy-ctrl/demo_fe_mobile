import 'package:flutter/material.dart';
import 'package:markon_project/helper/custom_textfield.dart';

import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';

class Verifpop extends StatefulWidget {
  const Verifpop({super.key});

  @override
  State<Verifpop> createState() => _PopUpVerifState();
}

class _PopUpVerifState extends State<Verifpop> {
  final key = GlobalKey<FormState>();
  TextEditingController emailCo = TextEditingController();
  int count = 2;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Container(
        padding: EdgeInsets.only(
            left: context.deviceWidth(0.1222222222222222),
            right: context.deviceWidth(0.1222222222222222),
            top: context.deviceHeight(0.0275)),
        height: context.deviceHeight(0.76),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: context.deviceHeight(0.25375),
                  width: context.deviceWidth(0.7567777777777778),
                  child: Image.asset(
                    'assets/image/rafiki.png',
                    fit: BoxFit.fill,
                  )),
              SizedBox(height: context.deviceHeight(0.025)),
              Center(
                  child: Column(children: [
                Text('Verification Code',
                    style: TextStyle(
                        fontSize: context.scaleFont(20),
                        fontWeight: FontWeight.w600)),
                SizedBox(height: context.deviceHeight(0.01875)),
                Text('We Have Sent the Code Verification to',
                    style: TextStyle(
                        fontSize: context.scaleFont(12),
                        fontWeight: FontWeight.w400)),
                SizedBox(height: context.deviceHeight(0.01)),
                Text('Your Email',
                    style: TextStyle(
                        fontSize: context.scaleFont(12),
                        fontWeight: FontWeight.w400)),
                SizedBox(height: context.deviceHeight(0.01875)),
                CustomFormTextField(
                  hint: 'EMAIL',
                  enabled: false,
                  readOnly: false,
                  controller: emailCo,
                  maxLength: 30,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: context.deviceHeight(0.015),
                ),
                Row(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      children: [
                        otpTextField(context, true),
                        otpTextField(context, false),
                        otpTextField(context, false),
                        otpTextField(context, false),
                        otpTextField(context, false),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: context.deviceHeight(0.045),
                ),
                CustomButtonWithFreeColor(
                  widthrectang: 2.0,
                  colorRectang: Markongold,
                  buttonHeight: context.deviceHeight(0.0625),
                  buttonWidth: context.deviceWidth(0.25),
                  radius: 10,
                  title: 'Submit',
                  fontWeight: FontWeight.w700,
                  fontSizel: context.scaleFont(12),
                  color: Markongold,
                  textColor: MarkonBluePrimary,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.deviceHeight(0.01555),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Didn't receive code ? "),
                    Text(
                      'Resend Code',
                      style: TextStyle(color: MarkBlue),
                    )
                  ],
                ),
                SizedBox(
                  height: context.deviceHeight(0.2),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget otpTextField(BuildContext context, bool autoFocus) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextFormField(
          autofocus: autoFocus,
          decoration: InputDecoration(
            fillColor: TrustPostLightGrey300,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: TrustPostLightGrey300)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide:
                    BorderSide(color: TrustPostLightGrey300, width: 0.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: TrustPostDanger, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: TrustPostDanger, width: 0.5)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: TrustPostLightGrey300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
