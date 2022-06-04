import 'package:vtop_app/Academic_calender/academic_calender_obj.dart';

import 'prefs.dart';

class PrefAcademicCalender {
  static const String key = 'academic_calender_data';

  static saveAcademicCalenderJSON(dynamic data) async {
    SharedPref pref = SharedPref();
    await pref.save(key, data);
  }

  static Future<AcademicCalender?> getAcademicCalender() async {
    var pref = SharedPref();
    var data = await pref.get(key);
    return (data == null) ? null : AcademicCalender.fromJson(data);
  }

  static removeAcademicCalender() async {
    var pref = SharedPref();
    await pref.remove(key);
  }
}
