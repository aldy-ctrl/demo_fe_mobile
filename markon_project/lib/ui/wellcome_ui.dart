import 'package:flutter/material.dart';

import 'package:markon_project/helper/extensions.dart';
import 'package:markon_project/theme/colors.dart';
import 'package:markon_project/ui/content_well_screen.dart';

class WellScreen extends StatefulWidget {
  const WellScreen({super.key});

  @override
  State<WellScreen> createState() => _WellScreenState();
}

class _WellScreenState extends State<WellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: context.deviceHeight(1),
        width: context.deviceWidth(1),
        color: MarkonBlue,
        child: Content_Welcome_Screen(),
      ),
    );
  }
}


//cek test
