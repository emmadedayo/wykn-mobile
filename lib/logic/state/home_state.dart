import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:wykn/models/electricity_model.dart';
import 'package:wykn/models/user.dart';

class HomeState {
  bool isLoading;
  bool? hasError;
  BuildContext? context;
  String? message;
  TextEditingController? meterNo = TextEditingController();
  SingleValueDropDownController? accountType = SingleValueDropDownController();
  SingleValueDropDownController? serviceType = SingleValueDropDownController();
  TextEditingController? amount = TextEditingController();
  ElectricityModel? electricityService;
  Map<String, dynamic>? data;
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  UserModel? user;
  HomeState({this.isLoading = false, this.message, this.hasError, this.user, this.context});
  HomeState copy() {
    HomeState copy = HomeState(isLoading: isLoading, message: message, hasError: hasError, user: user, context: context);
    copy.meterNo = meterNo;
    copy.accountType = accountType;
    copy.serviceType = serviceType;
    copy.amount = amount;
    copy.data = data;
    copy.formKey = formKey;
    copy.electricityService = electricityService;
    return copy;
  }
}
