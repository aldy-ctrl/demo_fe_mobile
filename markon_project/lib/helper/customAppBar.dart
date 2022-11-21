import 'package:flutter/material.dart';

class CustomAppBarMarkon extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final double? rightPadding;
  final double? leftPadding;

  CustomAppBarMarkon({
    this.leftPadding,
    this.rightPadding,
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: leftPadding!, right : rightPadding!) ,
      height: preferredSize.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: child,
    );
  }
}
