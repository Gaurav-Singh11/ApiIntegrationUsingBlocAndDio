import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/progress_helper.dart';
import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/data_layer/res/numbers.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';
import 'package:netcarrots_task/src/bloc_registration.dart';
import 'package:netcarrots_task/src/ui_layer/screens/splash_screen.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations_delegate.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/log_helper.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/util_helper.dart';

/// Navigator key is to get the current context, state and widget of
/// the Material App
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final String _tag = "MyApp:";
  late String _locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Remove observer before widget dispose
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locale) {
    super.didChangeLocales(locale);

    /// Change the locale when device locale is changed from settings in android
    /// For iOS app is automatically restarted
    if (Platform.isAndroid) {
      LogHelper.logData("$_tag Locale changed ===> $locale");
      setState(() {
        _locale = locale!.first.languageCode;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    LogHelper.logData("$_tag AppLifecycleState ===> $state");
    switch(state){
      case AppLifecycleState.paused:
        // TODO: Do something when app goes in background
        break;
      case AppLifecycleState.resumed:
        // TODO: Do something when app opens from background
        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppStyles.setStatusBarTheme();
    return _mainApp(context);
  }

  Future<String> _setAppLocale() async {
    await Devicelocale.currentLocale.then((res) {
      _locale = UtilHelper.instance.getLocale(res!);
    });
    return _locale;
  }

  Widget _mainApp(BuildContext context) {
    return FutureBuilder(
      future: _setAppLocale(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return MultiBlocProvider(
            providers: RegisterBlocs.blocs(context),
            child: MaterialApp(
              navigatorKey: navigatorKey,
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: d_1),
                  child: child!,
                );
              },
              theme: AppStyles.getAppTheme(),
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.current.title,
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale(_locale),
              supportedLocales: AppLocalizationsDelegate.supportedLocales,
              home: const SplashScreen(),
              navigatorObservers: const [],
            ),
          );
        } else {
          return _loadingWidget(context);
        }
      },
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      alignment: Alignment.center,
      child: const ProgressBar(),
    );
  }
}
