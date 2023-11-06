// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:netcarrots_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/ui_layer/screens/login_screen.dart';
import 'package:netcarrots_task/src/ui_layer/screens/user_detail_screen.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/progress_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Used addPostFrameCallback to perform an action after
    // the first frame is built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onAfterBuild(context);
    });
  }

  /// Main returning widget which returns the whole UI of screen
  @override
  Widget build(BuildContext context) {
    return _mainWidget(context);
  }

  Widget _mainWidget(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      alignment: Alignment.center,
      child: const ProgressBar(),
    );
  }

  /// Callback method called after the screen is built.
  /// It checks if the user is logged in and navigates to the appropriate screen.
  Future<void> _onAfterBuild(BuildContext context) async {
    final isLoggedIn = await UserStateHiveHelper.instance.isLoggedIn();
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(ScreenNavigation.createRoute(
          widget: const UserDetailScreen(), showPageRoute: true));
    } else {
      Navigator.of(context).pushReplacement(ScreenNavigation.createRoute(
          widget: const LoginScreen(), showPageRoute: true));
    }
  }
}
