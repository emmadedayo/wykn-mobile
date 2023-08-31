import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:wykn/models/user.dart';

class AppState {
  UserModel? user;
  List<DropDownValueModel> electricityConstantServices;
  List<DropDownValueModel> electricityServicesType;
  BuildContext? context;
  String? message;
  bool? hasError;
  bool userLogin;
  AppState({
    this.user,
    this.context,
    this.electricityConstantServices = const [],
    this.electricityServicesType = const [],
    this.message,
    this.hasError,
    this.userLogin = false,
  });

  AppState copy() {
    AppState copy = AppState(
      user: user,
      context: context,
      electricityConstantServices: electricityConstantServices,
      electricityServicesType: electricityServicesType,
      message: message,
      hasError: hasError,
      userLogin: userLogin,
    );
    return copy;
  }
}
