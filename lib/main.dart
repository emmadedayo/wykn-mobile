import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wykn/logic/cubit/app_cubit.dart';
import 'package:wykn/logic/cubit/splashCubit.dart';
import 'package:wykn/logic/hive/hive_adapter.dart';
import 'package:wykn/logic/hive/hive_db.dart';
import 'package:wykn/logic/hive/hive_usermodel_adapter.dart';
import 'package:wykn/logic/state/app_state.dart';
import 'package:wykn/models/user.dart';
import 'package:wykn/presentation/auth/base.dart';
import 'package:wykn/presentation/home/home.dart';
import 'package:wykn/router.dart';
import 'package:wykn/widgets/loading_overlay_widget.dart';

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<MyHiveBox>(MyHiveBoxAdapter());
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) => AppCubit(AppState())),
          BlocProvider<SplashCubit>(create: (context) => SplashCubit(AppState(context: context))),
        ],
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(393, 845.3),
              builder: (widget, child) => LoadingOverlayWidget(
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Wykn',
                      home: WillPopScope(
                          child: BlocListener<AppCubit, AppState>(
                            listener: appListener,
                            child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
                              if (state.user != null) {
                                return const Dashboard();
                              } else {
                                return const BaseScreen();
                              }
                            }),
                          ),
                          onWillPop: () async {
                            return Future<bool>.value(true); // this will close the app,
                          }),
                      theme: AppTheme.lightMode,
                      onGenerateRoute: onGenerate,
                    ),
                  ));
        }));
  }

  appListener(BuildContext context, AppState state) async {
    //get all notifications once a user is initialized
  }
}
