import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// A helper class for managing Hive database and adapters.
class HiveDatabaseHelper {
  /// Private constructor for singleton
  HiveDatabaseHelper._privateConstructor();

  /// Singleton instance creation
  static final _instance = HiveDatabaseHelper._privateConstructor();

  /// Get the singleton instance
  static HiveDatabaseHelper get instance => _instance;

  /// Initializes Hive and registers adapters for data models. This method
  /// should not be edited unless new adapters are needed. It initializes Hive
  /// with a custom database file path and registers adapters for data models
  /// that need to be saved locally. Returns [true] if initialization is
  /// successful, otherwise [false].
  Future<bool> initializeHiveAndRegisterAdapters() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String dbFilePath = [appDocDir.path, 'architecture_db'].join('/');
      Hive.init(dbFilePath);

      /// For every model that needs to be saved locally, an adapter is generated
      /// These adapter need to be registered
      // Hive.registerAdapter(UserAdapter());
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// A class that defines keys for user-related state data.
class UserStateKeys {
  /// Private constructor to prevent class instantiation
  UserStateKeys._privateConstructor();

  static const String loggedIn = 'logged_in';
  static const String userData = 'user_data';
  static const String languageCode = 'language_code';
  static const String languageCountryCode = 'language_country_code';
}

/// A class that defines keys for Hive boxes.
class Boxes {
  /// Private constructor to prevent class instantiation
  Boxes._privateConstructor();

  static const String userBox = 'user_box';
}
