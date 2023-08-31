import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wykn/logic/cubit/signup_cubit.dart';
import 'package:wykn/logic/state/signup_state.dart';
import 'package:wykn/router_name.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/custom_toast.dart';
import 'package:wykn/utils/helper_style.dart';
import 'package:wykn/widgets/custom_button.dart';
import 'package:wykn/widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(SignUpState(context: context)),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (regContext, regState) {
          return BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) async {
                if (state.hasError == true && state.message != null) {
                  ToastUtils.displayErrorMessage(context, state.message!);
                  context.read<SignUpCubit>().state.hasError = null;
                  context.read<SignUpCubit>().state.message = null;
                }
                if (state.hasError == false && state.message != null) {
                  ToastUtils.displaySuccessMessage(context, state.message!);
                  //wait for 2 seconds
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushNamed(context, RouterName.basedHome);
                  });
                  context.read<SignUpCubit>().state.hasError = null;
                  context.read<SignUpCubit>().state.message = null;
                }
              },
              child: Scaffold(
                backgroundColor: AppColors.mainColor,
                body: SafeArea(
                  bottom: false,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0.0,
                        top: -20.0,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            "assets/images/light_illustration.png",
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(
                                      IconlyBold.arrowLeft,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Create an account",
                                    style: HelperStyle.textStyle(color: AppColors.whiteColor, fontSize: 20, weight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Flexible(
                              child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    minHeight: MediaQuery.of(context).size.height - 180.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(24.0),
                                  child: Form(
                                    key: regState.formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        TextFieldWidget(
                                          hintText: "Fullname",
                                          textInputType: TextInputType.text,
                                          controller: regState.name,
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
                                                "Fullname",
                                                style: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            labelStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                            hintText: "Enter your fullname",
                                            hintStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        TextFieldWidget(
                                          hintText: "Email",
                                          textInputType: TextInputType.text,
                                          controller: regState.email,
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
                                                "Email",
                                                style: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            labelStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                            hintText: "Enter your email",
                                            hintStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        TextFieldWidget(
                                          hintText: "Password",
                                          textInputType: TextInputType.text,
                                          isPassword: regState.isPasswordVisible,
                                          controller: regState.passwordController,
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
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                regState.isPasswordVisible! ? Icons.visibility_off : Icons.visibility,
                                                color: AppColors.textFieldLabelColor,
                                              ),
                                              onPressed: () {
                                                regContext.read<SignUpCubit>().changePasswordVisibility();
                                              },
                                            ),
                                            label: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF9F9FB),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                "Password",
                                                style: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            labelStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                            hintText: "Enter your password",
                                            hintStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        TextFieldWidget(
                                          hintText: "Password Confirmation",
                                          textInputType: TextInputType.text,
                                          isPassword: regState.isPasswordVisible,
                                          controller: regState.passwordRepeatController,
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
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                regState.isPasswordVisible! ? Icons.visibility_off : Icons.visibility,
                                                color: AppColors.textFieldLabelColor,
                                              ),
                                              onPressed: () {
                                                regContext.read<SignUpCubit>().changePasswordVisibility();
                                              },
                                            ),
                                            label: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF9F9FB),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                "Password",
                                                style: HelperStyle.textStyle(
                                                    color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                              ),
                                            ),
                                            labelStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                            hintText: "Enter your password confirmation",
                                            hintStyle:
                                                HelperStyle.textStyle(color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        ButtonWidget(
                                          containerHeight: 60,
                                          containerWidth: 379,
                                          buttonText: "Create Account",
                                          buttonTextSize: 16,
                                          onTap: () async {
                                            FocusScope.of(context).unfocus();
                                            if (regState.formKey!.currentState!.validate()) {
                                              await regContext.read<SignUpCubit>().signUp();
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
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            "Have an account? Login",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
