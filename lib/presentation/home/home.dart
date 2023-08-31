import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wykn/logic/cubit/app_cubit.dart';
import 'package:wykn/logic/cubit/home_cubit.dart';
import 'package:wykn/logic/state/app_state.dart';
import 'package:wykn/logic/state/home_state.dart';
import 'package:wykn/router_name.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/custom_toast.dart';
import 'package:wykn/utils/helper_style.dart';
import 'package:wykn/widgets/custom_button.dart';
import 'package:wykn/widgets/textfield_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (appContext, appState) {
      return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(HomeState(context: context, user: appState.user)),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (homeContext, homeState) {
            return BlocListener<HomeCubit, HomeState>(
                listener: (context, state) async {
                  if (state.hasError == true && state.message != null) {
                    ToastUtils.displayErrorMessage(context, 'Error validating your request, please try again later');
                    context.read<HomeCubit>().state.hasError = null;
                    context.read<HomeCubit>().state.message = null;
                  }
                  if (state.hasError == false && state.electricityService != null) {
                    Navigator.pushNamed(context, RouterName.confirmBills, arguments: {
                      "homeCubit": context.read<HomeCubit>(),
                      "data": state.data,
                      "electricityModel": homeState.electricityService,
                    });
                    homeState.amount?.clear();
                    homeState.meterNo?.clear();
                    homeState.accountType?.clearDropDown();
                    homeState.serviceType?.clearDropDown();
                    context.read<HomeCubit>().state.hasError = null;
                    context.read<HomeCubit>().state.message = null;
                  }
                },
                child: Scaffold(
                  backgroundColor: AppColors.mainColor,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0.0,
                        top: -10.0,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            "assets/images/bulb.png",
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: kToolbarHeight,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Welcome back, \n${appContext.read<AppCubit>().state.user?.name ?? ""}",
                                        style: HelperStyle.textStyle(color: AppColors.whiteColor, fontSize: 20, weight: FontWeight.normal),
                                      ),
                                      Image.asset(
                                        "assets/images/dp.png",
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  minHeight: MediaQuery.of(context).size.height - 200.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  color: AppColors.whiteColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Purchase Electricity",
                                        style: TextStyle(
                                          color: Color.fromRGBO(19, 22, 33, 1),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      const SizedBox(height: 7.0),
                                      Form(
                                        key: homeState.formKey,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            TextFieldWidget(
                                              hintText: "Meter Number",
                                              textInputType: TextInputType.number,
                                              controller: homeState.meterNo,
                                              validator: MultiValidator([
                                                RequiredValidator(errorText: "* Required"),
                                              ]),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: AppColors.whiteColor,
                                                border: const OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
                                                ),
                                                contentPadding: const EdgeInsets.all(15),
                                                alignLabelWithHint: true,
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                label: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF9F9FB),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Text(
                                                    "Meter Number",
                                                    style: HelperStyle.textStyle(
                                                        color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                  ),
                                                ),
                                                labelStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                hintText: "Enter Meter Number",
                                                hintStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25.0,
                                            ),
                                            DropDownTextField(
                                              // initialValue: "name4",
                                              controller: homeState.serviceType,
                                              clearOption: true,
                                              enableSearch: true,
                                              searchDecoration: const InputDecoration(hintText: "enter your custom hint text here"),
                                              validator: MultiValidator([
                                                RequiredValidator(errorText: "* Required"),
                                              ]),
                                              dropDownItemCount: 6,
                                              dropDownList: homeContext.read<AppCubit>().state.electricityConstantServices,
                                              onChanged: (val) {},
                                              textFieldDecoration: InputDecoration(
                                                filled: true,
                                                fillColor: AppColors.whiteColor,
                                                border: const OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
                                                ),
                                                contentPadding: const EdgeInsets.all(15),
                                                alignLabelWithHint: true,
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                label: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF9F9FB),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Text(
                                                    "Select Service",
                                                    style: HelperStyle.textStyle(
                                                        color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                  ),
                                                ),
                                                labelStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                hintText: "Select Service",
                                                hintStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25.0,
                                            ),
                                            DropDownTextField(
                                              // initialValue: "name4",
                                              controller: homeState.accountType,
                                              clearOption: true,
                                              enableSearch: false,
                                              validator: MultiValidator([
                                                RequiredValidator(errorText: "* Required"),
                                              ]),
                                              dropDownItemCount: 6,
                                              dropDownList: homeContext.read<AppCubit>().state.electricityServicesType,
                                              onChanged: (val) {},
                                              textFieldDecoration: InputDecoration(
                                                filled: true,
                                                fillColor: AppColors.whiteColor,
                                                border: const OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
                                                ),
                                                contentPadding: const EdgeInsets.all(15),
                                                alignLabelWithHint: true,
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                label: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF9F9FB),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Text(
                                                    "Select Service Type",
                                                    style: HelperStyle.textStyle(
                                                        color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                  ),
                                                ),
                                                labelStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                hintText: "Select Service Type",
                                                hintStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25.0,
                                            ),
                                            TextFieldWidget(
                                              hintText: "Amount",
                                              textInputType: TextInputType.number,
                                              controller: homeState.amount,
                                              validator: MultiValidator([
                                                RequiredValidator(errorText: "* Required"),
                                              ]),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: AppColors.whiteColor,
                                                border: const OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
                                                ),
                                                contentPadding: const EdgeInsets.all(15),
                                                alignLabelWithHint: true,
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                label: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF9F9FB),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: Text(
                                                    "Amount",
                                                    style: HelperStyle.textStyle(
                                                        color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                  ),
                                                ),
                                                labelStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                                hintText: "Enter your amount",
                                                hintStyle: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25.0,
                                            ),
                                            ButtonWidget(
                                              containerHeight: 60,
                                              containerWidth: 379,
                                              buttonText: "Purchase Electricity",
                                              buttonTextSize: 16,
                                              onTap: () async {
                                                //Navigator.pushNamed(context, RouterName.confirmBills);

                                                FocusScope.of(context).unfocus();
                                                if (homeState.formKey!.currentState!.validate()) {
                                                  await homeContext.read<HomeCubit>().validateMeter();
                                                } else {
                                                  ToastUtils.displayErrorMessage(context, 'Please fill in all fields');
                                                }
                                              },
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.mainColor,
                                                  AppColors.secondaryColor,
                                                ], // Replace with your desired colors
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              textColor: AppColors.whiteColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      );
    });
  }
}
