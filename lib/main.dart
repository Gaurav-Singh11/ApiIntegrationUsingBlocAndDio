import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:netcarrots_task/src/business_layer/network/api_constants.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/device_info_helper.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/flavor_configuration_helper.dart';
import 'package:netcarrots_task/src/data_layer/local_db/hive_database_helper.dart';
import 'package:netcarrots_task/src/my_app.dart';

import 'src/data_layer/res/styles.dart';

Future<void> main() async {
  /// Initialize the WidgetFlutterBinding if required
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets the status bar color of the widget
  AppStyles.setStatusBarTheme();

  /// Sets Device info
  DeviceInfo.setDeviceId();

  /// Initialize Hive DB and register adapters and generate encryption key
  await HiveDatabaseHelper.instance.initializeHiveAndRegisterAdapters();

  /// Sets the device orientation of the application
  AppStyles.setDeviceOrientationOfApp();

  await dotenv.load(fileName: "assets/.env");
  // ApiConstants.urlDevServer = dotenv.env['API_BASE_URL'] ?? "";

  /// Sets the server configuration of the application
  FlavorConfig.setServerConfig();

  /// Run the application
  runApp(const MyApp());
}
