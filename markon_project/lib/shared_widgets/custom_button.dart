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
  final double? widthrectang;
  final Color? colorRectang;
  final FontWeight? fontWeight;

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
      this.fontSizel,
      this.colorRectang,
      this.fontWeight,
      this.widthrectang});

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
                  borderRadius: BorderRadius.circular(radius!),
                  side:
                      BorderSide(color: colorRectang!, width: widthrectang!))),
          child: Text(
            title!,
            style: TextStyle(
                fontSize: fontSizel,
                color: textColor,
                fontWeight: fontWeight),
          )),
    );
  }
}
