import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper{
  static late SharedPreferences storage;

  static readStorage(String key) {
    return storage.get(key);
  }

  static writeStorageString(String key, String value) {
    storage.setString(key, value);
  }

  static writeStorageBool(String key, bool value) {
    storage.setBool(key, value);
  }

  static writeStorageInt(String key, int value) {
    storage.setInt(key, value);
  }

  static removeStorage() async {
    await storage.clear();
  }

}



