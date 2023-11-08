import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/data_layer/res/numbers.dart';

class AppStyles {
  /// Private constructor to prevent class instantiation
  AppStyles._privateConstructor();

  /// Text styles
  static final mainNormal14 = TextStyle(
    color: AppColors.mainColor,
    fontSize: getFontSize(d_14),
    fontWeight: FontWeight.normal,
  );
  static final mainBold14 = TextStyle(
    color: AppColors.mainColor,
    fontSize: getFontSize(d_15),
    fontWeight: FontWeight.bold,
  );
  static final whiteLightBold20 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(d_20),
    fontWeight: FontWeight.w700,
  );

  /// Method used to get font size according to device
  static double getFontSize(double value) {
    return value;
  }

  /// Method used to get height according to device
  static double getHeight(double value) {
    return value;
  }

  static double getScale(double value) {
    return value;
  }

  /// Method used to get width according to device
  static double getWidth(double value) {
    return value;
  }

  /// Paddings
  static EdgeInsets pd0 = const EdgeInsets.all(d_0);
  static EdgeInsets pd1 = const EdgeInsets.all(d_1);
  static EdgeInsets pd2 = const EdgeInsets.all(d_2);
  static EdgeInsets pd3 = const EdgeInsets.all(d_3);
  static EdgeInsets pd4 = const EdgeInsets.all(d_4);
  static EdgeInsets pd5 = const EdgeInsets.all(d_5);
  static EdgeInsets pd6 = const EdgeInsets.all(d_6);
  static EdgeInsets pd7 = const EdgeInsets.all(d_7);
  static EdgeInsets pd8 = const EdgeInsets.all(d_8);
  static EdgeInsets pd9 = const EdgeInsets.all(d_9);
  static EdgeInsets pd10 = const EdgeInsets.all(d_10);
  static EdgeInsets pd11 = const EdgeInsets.all(d_11);
  static EdgeInsets pd12 = const EdgeInsets.all(d_12);
  static EdgeInsets pd13 = const EdgeInsets.all(d_13);
  static EdgeInsets pd14 = const EdgeInsets.all(d_14);
  static EdgeInsets pd15 = const EdgeInsets.all(d_15);
  static EdgeInsets pd16 = const EdgeInsets.all(d_16);
  static EdgeInsets pd17 = const EdgeInsets.all(d_17);
  static EdgeInsets pd18 = const EdgeInsets.all(d_18);
  static EdgeInsets pd19 = const EdgeInsets.all(d_19);
  static EdgeInsets pd20 = const EdgeInsets.all(d_20);
  static EdgeInsets pd21 = const EdgeInsets.all(d_21);
  static EdgeInsets pd23 = const EdgeInsets.all(d_23);
  static EdgeInsets pd24 = const EdgeInsets.all(d_24);
  static EdgeInsets pd25 = const EdgeInsets.all(d_25);
  static EdgeInsets pd30 = const EdgeInsets.all(d_30);
  static EdgeInsets pd35 = const EdgeInsets.all(d_35);
  static EdgeInsets pd40 = const EdgeInsets.all(d_40);
  static EdgeInsets pd45 = const EdgeInsets.all(d_45);
  static EdgeInsets pd50 = const EdgeInsets.all(d_50);
  static EdgeInsets pd100 = const EdgeInsets.all(d_100);

  static EdgeInsets pdT5 = const EdgeInsets.only(top: d_5);
  static EdgeInsets pdT8 = const EdgeInsets.only(top: d_8);
  static EdgeInsets pdT10 = const EdgeInsets.only(top: d_10);
  static EdgeInsets pdT15 = const EdgeInsets.only(top: d_15);
  static EdgeInsets pdL27 = const EdgeInsets.only(left: d_27);
  static EdgeInsets pdL30 = const EdgeInsets.only(left: d_30);

  static const EdgeInsets pdH4 = EdgeInsets.symmetric(horizontal: d_4);
  static const EdgeInsets pdH8 = EdgeInsets.symmetric(horizontal: d_8);
  static const EdgeInsets pdH10 = EdgeInsets.symmetric(horizontal: d_10);
  static const EdgeInsets pdH13 = EdgeInsets.symmetric(horizontal: d_13);
  static const EdgeInsets pdH12V3 =
      EdgeInsets.symmetric(horizontal: d_12, vertical: d_3);
  static const EdgeInsets pdH8V5 =
      EdgeInsets.symmetric(horizontal: d_8, vertical: d_5);
  static const EdgeInsets pdH10V8 =
      EdgeInsets.symmetric(horizontal: d_10, vertical: 8);
  static const EdgeInsets pdH10V17 =
      EdgeInsets.symmetric(horizontal: d_10, vertical: 17);
  static const EdgeInsets pdH15 = EdgeInsets.symmetric(horizontal: d_15);
  static const EdgeInsets pdH16V13 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: 13);
  static const EdgeInsets pdH20 = EdgeInsets.symmetric(horizontal: d_20);
  static const EdgeInsets pdH30 = EdgeInsets.symmetric(horizontal: d_30);
  static const EdgeInsets pdH30V10 =
      EdgeInsets.symmetric(horizontal: d_30, vertical: 10);
  static const EdgeInsets pdH30V5 =
      EdgeInsets.symmetric(horizontal: d_30, vertical: 5);
  static const EdgeInsets pdV10 = EdgeInsets.symmetric(vertical: d_10);
  static const EdgeInsets pdV12 = EdgeInsets.symmetric(vertical: d_12);
  static const EdgeInsets pdV6 = EdgeInsets.symmetric(vertical: d_6);
  static const EdgeInsets pdH12V6 =
      EdgeInsets.symmetric(vertical: d_6, horizontal: d_12);
  static const EdgeInsets pdH20V8 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_8);
  static const EdgeInsets pdH20V5 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_8);
  static const EdgeInsets pdH20V10 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_10);
  static const EdgeInsets pdH20V12 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_12);

  static const EdgeInsets pdL20R7 = EdgeInsets.only(left: d_20, right: d_7);
  static const EdgeInsets pdL20R28 = EdgeInsets.only(left: d_20, right: d_28);
  static const EdgeInsets pdH20V16 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_16);

  static const pdH50 = EdgeInsets.symmetric(horizontal: d_50);
  static const screenHorizontalPadding = EdgeInsets.symmetric(
    horizontal: d_20,
  );

  /// Sized Box
  static final SizedBox sbHeight1 = SizedBox(height: getHeight(d_1));
  static final SizedBox sbHeight2 = SizedBox(height: getHeight(d_2));
  static final SizedBox sbHeight3 = SizedBox(height: getHeight(d_3));
  static final SizedBox sbHeight4 = SizedBox(height: getHeight(d_4));
  static final SizedBox sbHeight5 = SizedBox(height: getHeight(d_5));
  static final SizedBox sbHeight6 = SizedBox(height: getHeight(d_6));
  static final SizedBox sbHeight7 = SizedBox(height: getHeight(d_7));
  static final SizedBox sbHeight8 = SizedBox(height: getHeight(d_8));
  static final SizedBox sbHeight9 = SizedBox(height: getHeight(d_9));
  static final SizedBox sbHeight10 = SizedBox(height: getHeight(d_10));
  static final SizedBox sbHeight11 = SizedBox(height: getHeight(d_11));
  static final SizedBox sbHeight12 = SizedBox(height: getHeight(d_12));
  static final SizedBox sbHeight13 = SizedBox(height: getHeight(d_13));
  static final SizedBox sbHeight14 = SizedBox(height: getHeight(d_14));
  static final SizedBox sbHeight15 = SizedBox(height: getHeight(d_15));
  static final SizedBox sbHeight16 = SizedBox(height: getHeight(d_16));
  static final SizedBox sbHeight17 = SizedBox(height: getHeight(d_17));
  static final SizedBox sbHeight18 = SizedBox(height: getHeight(d_18));
  static final SizedBox sbHeight19 = SizedBox(height: getHeight(d_19));
  static final SizedBox sbHeight20 = SizedBox(height: getHeight(d_20));
  static final SizedBox sbHeight21 = SizedBox(height: getHeight(d_21));
  static final SizedBox sbHeight22 = SizedBox(height: getHeight(d_22));
  static final SizedBox sbHeight24 = SizedBox(height: getHeight(d_24));
  static final SizedBox sbHeight25 = SizedBox(height: getHeight(d_25));
  static final SizedBox sbHeight26 = SizedBox(height: getHeight(d_26));
  static final SizedBox sbHeight27 = SizedBox(height: getHeight(d_27));
  static final SizedBox sbHeight28 = SizedBox(height: getHeight(d_28));
  static final SizedBox sbHeight29 = SizedBox(height: getHeight(d_29));
  static final SizedBox sbHeight30 = SizedBox(height: getHeight(d_30));
  static final SizedBox sbHeight34 = SizedBox(height: getHeight(d_34));
  static final SizedBox sbHeight44 = SizedBox(height: getHeight(d_44));
  static final SizedBox sbHeight50 = SizedBox(height: getHeight(d_50));
  static final SizedBox sbHeight48 = SizedBox(height: getHeight(d_48));
  static final SizedBox sbHeight100 = SizedBox(height: getHeight(d_100));
  static final SizedBox sbWidth1 = SizedBox(width: getWidth(d_1));
  static final SizedBox sbWidth2 = SizedBox(width: getWidth(d_2));
  static final SizedBox sbWidth3 = SizedBox(width: getWidth(d_3));
  static final SizedBox sbWidth4 = SizedBox(width: getWidth(d_4));
  static final SizedBox sbWidth5 = SizedBox(width: getWidth(d_5));
  static final SizedBox sbWidth6 = SizedBox(width: getWidth(d_6));
  static final SizedBox sbWidth7 = SizedBox(width: getWidth(d_7));
  static final SizedBox sbWidth8 = SizedBox(width: getWidth(d_8));
  static final SizedBox sbWidth9 = SizedBox(width: getWidth(d_9));
  static final SizedBox sbWidth10 = SizedBox(width: getWidth(d_10));
  static final SizedBox sbWidth11 = SizedBox(width: getWidth(d_11));
  static final SizedBox sbWidth12 = SizedBox(width: getWidth(d_12));
  static final SizedBox sbWidth13 = SizedBox(width: getWidth(d_13));
  static final SizedBox sbWidth14 = SizedBox(width: getWidth(d_14));
  static final SizedBox sbWidth15 = SizedBox(width: getWidth(d_15));
  static final SizedBox sbWidth20 = SizedBox(width: getWidth(d_20));
  static final SizedBox sbWidth25 = SizedBox(width: getWidth(d_25));
  static final SizedBox sbWidth50 = SizedBox(width: getWidth(d_50));

  /// BorderRadius
  BorderRadius br_20 = BorderRadius.circular(20.0);
  BorderRadius br_10 = BorderRadius.circular(10.0);
  BorderRadius brAll_4 = const BorderRadius.all(Radius.circular(4.0));

  /// Set the status bar color to the widget
  static void setStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.mainColor, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: AppColors.mainColor, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));
  }

  static void setDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: AppColors.mainColor,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch)
              .copyWith(secondary: AppColors.mainColor),
    );
  }
}
