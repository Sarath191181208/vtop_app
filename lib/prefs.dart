import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);

    return (data == null) ? null : json.decode(data);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
