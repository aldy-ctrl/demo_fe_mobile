import 'package:flutter/material.dart';
import 'package:markon_project/shared_widgets/custom_snackbar.dart';

extension Scaler on BuildContext {
  double scaleFont(double initialFontSize) {
    return (MediaQuery.of(this).size.width * 0.0027) * initialFontSize;
  }

  double scaleHeight(double initialHeight) {
    return (MediaQuery.of(this).size.height * 0.0011) * initialHeight;
  }

  double deviceWidth(double widthFactor) {
    return (MediaQuery.of(this).size.width) * widthFactor;
  }

  double deviceHeight(double heightFactor) {
    return (MediaQuery.of(this).size.height) * heightFactor;
  }
}

extension SnackBars on BuildContext {
  failSnackbar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(failSnackBar(message));
  }

  succesSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(successSnackBar(message));
  }
}
