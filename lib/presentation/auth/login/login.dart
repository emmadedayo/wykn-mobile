import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wykn/logic/cubit/login_cubit.dart';
import 'package:wykn/logic/state/login_state.dart';
import 'package:wykn/router_name.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/custom_toast.dart';
import 'package:wykn/utils/helper_style.dart';
import 'package:wykn/widgets/custom_button.dart';
import 'package:wykn/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginState(context: context)),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (regContext, regState) {
          return BlocListener<LoginCubit, LoginState>(
              listener: (context, state) async {
                if (state.hasError == true && state.message != null) {
                  ToastUtils.displayErrorMessage(context, state.message!);
                  context.read<LoginCubit>().state.hasError = null;
                  context.read<LoginCubit>().state.message = null;
                }
                if (state.hasError == false && state.user != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouterName.dashboardName,
                    (route) => false,
                  );
                  context.read<LoginCubit>().state.hasError = null;
                  context.read<LoginCubit>().state.message = null;
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
                        child: Container(
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
                                        IconlyBold.arrowLeft2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "Log in to your account",
                                      style: HelperStyle.textStyle(color: AppColors.whiteColor, fontSize: 20, weight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
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
                                          // Lets make a generic input widget
                                          TextFieldWidget(
                                            hintText: "Email",
                                            textInputType: TextInputType.text,
                                            controller: regState.emailController,
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
                                                  regContext.read<LoginCubit>().changePasswordVisibility();
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
                                            height: 15.0,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Text(
                                              "Forgot Password?",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          ButtonWidget(
                                            containerHeight: 60,
                                            containerWidth: 379,
                                            buttonText: "Login",
                                            buttonTextSize: 16,
                                            onTap: () async {
                                              FocusScope.of(context).unfocus();
                                              if (regState.formKey!.currentState!.validate()) {
                                                await regContext.read<LoginCubit>().loginIn();
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
                                    )),
                              )
                            ],
                          ),
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
