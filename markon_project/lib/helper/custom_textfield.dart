import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markon_project/theme/colors.dart';

class CustomFormTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hint, label;
  final String? Function(String?)? validator, onChanged, onAction;
  final List<TextInputFormatter>? formatter;
  final Function()? onTap;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly, enabled;
  final int? maxLine, maxLength;
  final bool? obsecure;

  const CustomFormTextField(
      {Key? key,
      this.suffixIcon,
      this.hint,
      this.label,
      this.validator,
      this.onChanged,
      this.onAction,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.readOnly,
      this.onTap,
      this.controller,
      this.enabled,
      this.maxLine,
      this.maxLength,
      this.obsecure,
      this.formatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: this.inputType != TextInputType.number,
      inputFormatters: this.formatter,
      autofocus: true,
      readOnly: this.readOnly ?? false,
      controller: this.controller,
      validator: this.validator,
      onChanged: this.onChanged,
      focusNode: this.focusNode,
      keyboardType: this.inputType,
      maxLines: this.maxLine,
      obscureText: this.obsecure ?? false,
      textInputAction: this.inputAction,
      onFieldSubmitted: this.onAction,
      onTap: this.onTap,
      style: TextStyle(color: Colors.black, fontSize: 12),
      decoration: InputDecoration(
        suffixIcon: this.suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabled: this.enabled ?? true,
        labelText: this.label,
        hintText: this.hint,
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        labelStyle: TextStyle(
          fontSize: 12,
          color: MarkonsMainText,
        ),
        filled: true,
        fillColor: (readOnly == null)
            ? MarkonsLightGrey300
            : readOnly!
                ? MarkonsLightGrey300
                : MarkonsLightGrey300,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: MarkonsLightGrey300)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: MarkonsLightGrey300, width: 0.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: MarkonsLightGrey300, width: 0.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: MarkonsDanger, width: 0.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: MarkonsDanger, width: 0.5)),
      ),
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  final String? hint, label;
  final String? Function(String?)? validator, onChanged, onAction;
  final Function()? onHideTap;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly, enabled, hidePassword;
  final int? maxLength;

  const CustomPasswordTextField(
      {Key? key,
      this.hint,
      this.label,
      this.validator,
      this.onChanged,
      this.onAction,
      this.onHideTap,
      this.inputType,
      this.inputAction,
      this.controller,
      this.focusNode,
      this.readOnly,
      this.enabled,
      this.hidePassword,
      this.maxLength})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.hidePassword!,
      keyboardType: this.inputType ?? TextInputType.text,
      focusNode: this.focusNode,
      textInputAction: this.inputAction,
      onFieldSubmitted: this.onAction,
      maxLength: maxLength,
      style: TextStyle(color: MarkonsMainText, fontSize: 16),
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(color: MarkonsUnselect),
        isDense: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: this.onHideTap,
            child: Icon(
              this.hidePassword! ? Icons.visibility_off : Icons.visibility,
              color: MarkonsBlack,
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 32,
        ),
        hintText: this.hint,
        hintStyle: TextStyle(fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: MarkonsUnselect)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: MarkonsUnselect)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: MarkonsBlack, width: 1.8)),
        filled: true,
        fillColor: MarkonsFillField,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: MarkonsDanger)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: MarkonsDanger, width: 1.8)),
      ),
      onChanged: this.onChanged,
      validator: this.validator,
    );
  }
}
