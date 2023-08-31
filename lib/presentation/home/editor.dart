import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:wykn/logic/cubit/home_cubit.dart';
import 'package:wykn/utils/color.dart';
import 'package:wykn/utils/helper_style.dart';
import 'package:wykn/widgets/custom_button.dart';

import '../../models/electricity_model.dart';

class ConfirmBills extends StatelessWidget {
  final ElectricityModel electricityModel;
  final HomeCubit homeCubit;
  final Map<String, dynamic> data;
  const ConfirmBills({super.key, required this.electricityModel, required this.data, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0.0,
            top: -20.0,
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
                        "Confirm Bills",
                        style: HelperStyle.textStyle(
                          color: AppColors.whiteColor,
                          fontSize: 24,
                          weight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 400.0,
                ),
                Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                          Text(
                            "Electricity Confirmation",
                            style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 17, weight: FontWeight.w500),
                          ),
                          const SizedBox(height: 7.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Electricity Distribution",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 15, weight: FontWeight.normal),
                                  ),
                                  Text(
                                    "${data['channel']}",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 12, weight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Meter Number",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 15, weight: FontWeight.normal),
                                  ),
                                  Text(
                                    "${data['meterNo']}",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 12, weight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Customer Name",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 15, weight: FontWeight.normal),
                                  ),
                                  Text(
                                    electricityModel.name,
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 12, weight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Customer Address",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 15, weight: FontWeight.normal),
                                  ),
                                  Text(
                                    "123, Lorem Ipsum Street, Lagos",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 12, weight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Amount",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 15, weight: FontWeight.normal),
                                  ),
                                  Text(
                                    "₦ ${data['amount']}",
                                    style: HelperStyle.textStyle(color: const Color.fromRGBO(19, 22, 33, 1), fontSize: 17, weight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          //postion to the bottom
          Positioned(
              bottom: 0.0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ButtonWidget(
                  containerHeight: 60,
                  containerWidth: 379,
                  buttonText: "Pay Now",
                  buttonTextSize: 16,
                  onTap: () async {},
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
              )),
        ],
      ),
    );
  }
}
