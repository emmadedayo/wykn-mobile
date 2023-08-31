import 'package:flutter/material.dart';
import 'package:wykn/models/user.dart';

class LoginState {
  bool isLoading;
  bool? hasError;
  bool? isPasswordVisible;
  BuildContext? context;
  String? message;
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  UserModel? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginState({this.isLoading = false, this.message, this.hasError, this.user, this.context, this.isPasswordVisible = false});
  LoginState copy() {
    LoginState copy =
        LoginState(isLoading: isLoading, message: message, hasError: hasError, user: user, context: context, isPasswordVisible: isPasswordVisible);
    copy.emailController = emailController;
    copy.passwordController = passwordController;
    copy.formKey = formKey;
    return copy;
  }
}
