import 'prefs.dart';

class PrefStudent {
  static const String key = 'isDark';

  static saveTheme(bool isDark) async {
    SharedPref pref = SharedPref();
    await pref.saveBool(key, isDark);
  }

  static isDark() async {
    var pref = SharedPref();
    var data = await pref.get(key);
    return (data == null) ? false : data;
  }
}
