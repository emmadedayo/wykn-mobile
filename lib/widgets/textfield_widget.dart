import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/helper_style.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    required this.textInputType,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.validator,
    this.valueChanged,
    this.decoration,
    this.isPassword = false, // Default to false
    this.formatter,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final bool readOnly;
  final bool enabled;
  final bool? isPassword;
  final bool autofocus;
  final MultiValidator? validator;
  final ValueChanged? valueChanged;
  final InputDecoration? decoration;
  final List<FilteringTextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          readOnly: readOnly,
          enabled: enabled,
          obscureText: isPassword ?? false,
          inputFormatters: formatter,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: AppColors.backColor,
          validator: validator!,
          style: HelperStyle.textStyle(color: const Color.fromRGBO(0, 0, 0, 0.7), fontSize: 14, weight: FontWeight.normal),
          onChanged: valueChanged,
          keyboardType: textInputType,
          decoration: decoration,
        ),
      ],
    );
  }
}
