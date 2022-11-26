import 'package:flutter/material.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';
import 'package:markon_project/theme/colors.dart';
import 'package:markon_project/ui/otp_timer/otp_timer.dart';

class Verifpop extends StatefulWidget {
  final String? email;
  const Verifpop({super.key, this.email});

  @override
  State<Verifpop> createState() => _PopUpVerifState();
}

class _PopUpVerifState extends State<Verifpop>
    with SingleTickerProviderStateMixin {
  final key = GlobalKey<FormState>();
  TextEditingController emailCo = TextEditingController();
  int count = 2;
  int getinTime = 30;
  List<String> valueL = [];
  AnimationController? controller;
  bool hideText = true;
  int? timeInSecs;

  @override
  void initState() {
    timeInSecs = getinTime;
    emailCo.text = widget.email!;

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: getinTime))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                hideText = !hideText;
              });
            }
          });
    controller!
        .reverse(from: controller!.value == 0.0 ? 1.0 : controller!.value);
    _startCountdown();
    super.initState();
  }

  Future<Null> _startCountdown() async {
    setState(() {
      hideText = true;
      timeInSecs = getinTime;
    });
    controller!
        .reverse(from: controller!.value == 0.0 ? 1.0 : controller!.value);
  }

  get getTimerText {
    return Container(
      height: context.deviceHeight(0.04),
      child: Offstage(
        offstage: !hideText,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.access_time),
            Text('Fasttt, time left :'),
            SizedBox(
              width: 5.0,
            ),
            OtpTimer(controller!, 15.0, Colors.black)
          ],
        ),
      ),
    );
  }

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
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: MarkonsLightGrey300,
                    enabled: false,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((10)),
                        borderSide:
                            BorderSide(color: MarkonsLightGrey300, width: 0.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((10)),
                        borderSide: BorderSide(color: MarkonsLightGrey300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((10)),
                        borderSide: BorderSide(color: MarkonsLightGrey300)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: MarkonsLightGrey300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  controller: emailCo,
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
                  onTap: valueL.length == 5 ? () {} : null,
                ),
                SizedBox(
                  height: context.deviceHeight(0.01555),
                ),
                hideText ? getTimerText : getText(),
                SizedBox(
                  height: context.deviceHeight(0.5),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Row getText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Didn't receive code ? "),
        Text(
          'Resend Code',
          style: TextStyle(color: MarkBlue),
        )
      ],
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
            fillColor: MarkonsLightGrey300,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: MarkonsLightGrey300)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: MarkonsLightGrey300, width: 0.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: MarkonsDanger, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((10)),
                borderSide: BorderSide(color: MarkonsDanger, width: 0.5)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: MarkonsLightGrey300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              valueL.add(value);
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
