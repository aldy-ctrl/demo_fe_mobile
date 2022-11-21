import 'package:flutter/material.dart';

class CustomButtonWithFreeColor extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final String? title;
  final Color? color;
  final Color? textColor;
  final Color? disColor;
  final Function()? onTap;
  final double? radius;
  final double? fontSizel;

  const CustomButtonWithFreeColor(
      {super.key,
      this.buttonHeight,
      this.buttonWidth,
      this.title,
      this.color,
      this.onTap,
      this.disColor,
      this.radius,
      this.textColor,
      this.fontSizel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              disabledBackgroundColor: disColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!))),
          child: Text(
            title!,
            style: TextStyle(fontSize: fontSizel, color: textColor),
          )),
    );
  }
}
