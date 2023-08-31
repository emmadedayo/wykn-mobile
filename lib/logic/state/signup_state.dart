import 'package:flutter/material.dart';

class SignUpState {
  bool isLoading;
  bool? hasError;
  String? message;
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  List<String> listMessage = [];
  String? data;
  bool? isPasswordVisible;
  BuildContext? context;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  SignUpState({this.isLoading = false, this.message, this.hasError, this.data, this.context, this.isPasswordVisible = true});
  SignUpState copy() {
    SignUpState copy = SignUpState(
      isLoading: isLoading,
      message: message,
      hasError: hasError,
      data: data,
      isPasswordVisible: isPasswordVisible,
      context: context,
    );
    copy.name = name;
    copy.email = email;
    formKey = formKey;
    copy.password = password;
    copy.passwordController = passwordController;
    copy.passwordRepeatController = passwordRepeatController;
    return copy;
  }
}
