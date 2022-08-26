import 'prefs.dart';

class PrefTheme {
  static const String key = 'isDark';

  static saveTheme(bool isDark) async {
    SharedPref pref = SharedPref();
    await pref.saveBool(key, isDark);
  }

  static isDark() async {
    var pref = SharedPref();
    bool? data = await pref.getBool(key);
    return (data == null) ? false : data;
  }

  static deleteTheme() async {
    var pref = SharedPref();
    await pref.remove(key);
  }
}
