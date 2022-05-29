import '../Student/student_object.dart';
import 'prefs.dart';

class PrefStudent {
  static const String key = 'student_data';

  static saveStudentJSON(dynamic data) async {
    SharedPref pref = SharedPref();
    await pref.save(key, data);
  }

  static saveLoginCredentials(String username, String password) async {
    SharedPref pref = SharedPref();
    await pref.save('username', username);
    await pref.save('password', password);
  }

  static getStudent() async {
    var pref = SharedPref();
    var data = await pref.get(key);
    return (data == null) ? null : Student.fromJson(data);
  }

  static Future<List<String>> getLoginCredentials() async {
    var pref = SharedPref();
    String username = await pref.get('username');
    String password = await pref.get('password');
    return [username, password];
  }

  static removeStudent() async {
    var pref = SharedPref();
    await pref.remove(key);
  }

  static removeLoginCredentials() async {
    var pref = SharedPref();
    await pref.remove('username');
    await pref.remove('password');
  }
}
