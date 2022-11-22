import 'package:flutter/material.dart';
import 'package:markon_project/helper/custom_textfield.dart';
import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/shared_widgets/custom_button.dart';

class ModContain extends StatefulWidget {
  const ModContain({super.key});

  @override
  State<ModContain> createState() => _ModContainState();
}

class _ModContainState extends State<ModContain> {
  TextEditingController usernameCo = TextEditingController();
  TextEditingController passwordCo = TextEditingController();
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Navigator.pop(context);
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
            SizedBox(
              height: context.deviceHeight(0.06375),
              child: CustomFormTextField(
                hint: 'USERNAME',
                controller: usernameCo,
                maxLength: 30,
                inputType: TextInputType.emailAddress,
                validator: (value) =>
                    (value!.isEmpty) ? "Silahkan isi username" : null,
              ),
            ),
            SizedBox(
              height: context.deviceHeight(0.0125),
            ),
            SizedBox(
              height: context.deviceHeight(0.06375),
              child: TextFormField(
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
                    (value!.isEmpty) ? "Silahkan isi password" : null,
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
                    title: 'SIGN IN',
                    fontSizel: context.scaleFont(14),
                    color: Colors.white,
                    textColor: Colors.grey,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: context.deviceHeight(0.0175),
                  ),
                  GestureDetector(
                      child: Text(
                        'FORGOT PASSWORD ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
