import 'student_object.dart';
import '../prefs.dart';

class PrefStudent {
  static const String key = 'student_data';

  static saveStudentJSON(dynamic data) async {
    SharedPref pref = SharedPref();
    await pref.save(key, data);
  }

  static getStudent() async {
    var pref = SharedPref();
    var data = await pref.get(key);
    return (data == null) ? null : Student.fromJson(data);
  }

  static removeStudent() async {
    var pref = SharedPref();
    await pref.remove(key);
  }
}
