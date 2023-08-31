import 'package:flutter/material.dart';
import 'package:wykn/router_name.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/helper_style.dart';
import 'package:wykn/widgets/custom_button.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Positioned(
                //   top: 100.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Container(
                //     height: 150.0,
                //     width: double.infinity,
                //     decoration: const BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage("assets/images/cloth_faded.png"),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/illustration.png",
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    "Welcome to Billz!",
                    style: HelperStyle.textStyle(color: AppColors.backColor, fontSize: 20, weight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome to Billz!, the easiest way to pay your electricity bills in Nigeria.",
                    style: HelperStyle.textStyle(color: const Color.fromRGBO(74, 77, 84, 1), fontSize: 13, weight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Let's create a generic button widget
                  ButtonWidget(
                    containerHeight: 55,
                    containerWidth: 379,
                    buttonText: "Log In",
                    buttonTextSize: 16,
                    onTap: () async {
                      Navigator.pushNamed(context, RouterName.signInName);
                    },
                    color: AppColors.secondaryColor,
                    textColor: AppColors.whiteColor,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ButtonWidget(
                    containerHeight: 55,
                    containerWidth: 379,
                    buttonText: "Create an Account",
                    buttonTextSize: 16,
                    onTap: () async {
                      Navigator.pushNamed(context, RouterName.signUpName);
                    },
                    color: AppColors.mainColor,
                    textColor: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
