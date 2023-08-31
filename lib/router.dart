import 'package:flutter/material.dart';
import 'package:wykn/presentation/auth/base.dart';
import 'package:wykn/presentation/auth/login/login.dart';
import 'package:wykn/presentation/auth/signup/sign-up.dart';
import 'package:wykn/presentation/home/confirm-bills.dart';
import 'package:wykn/presentation/home/home.dart';
import 'package:wykn/router_name.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case RouterName.splashName:
      return MaterialPageRoute(builder: (_) => const BaseScreen());

    case RouterName.basedHome:
      return MaterialPageRoute(builder: (_) => const BaseScreen());

    case RouterName.signInName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case RouterName.signUpName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());

    case RouterName.dashboardName:
      return MaterialPageRoute(builder: (_) => const Dashboard());

    case RouterName.confirmBills:
      return MaterialPageRoute(
          builder: (_) => ConfirmBills(
                homeCubit: arguments!['homeCubit'],
                electricityModel: arguments['electricityModel'],
                data: arguments['data'],
              ));

    case '/':
      return MaterialPageRoute(builder: (_) => const BaseScreen());

    default:
      return errorRoute();
  }
}

MaterialPageRoute errorRoute() {
  return MaterialPageRoute(
    builder: ((context) => const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Route does not exist or route has not been registered.',
              ),
            ),
          ),
        )),
  );
}
