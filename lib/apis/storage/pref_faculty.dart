import '../../faculty/faculty_object.dart';
import 'prefs.dart';

class PrefFaculty {
  static const String key = 'faculty_data';

  static saveFacultyJSON(dynamic data) async {
    SharedPref pref = SharedPref();
    await pref.save(key, data);
  }

  static Future<Faculty?> getFaculty() async {
    var pref = SharedPref();
    var data = await pref.get(key);
    return (data == null) ? null : Faculty.fromJson(data);
  }

  static removeFaculty() async {
    var pref = SharedPref();
    await pref.remove(key);
  }
}
