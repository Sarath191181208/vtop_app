import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);

    return (data == null) ? null : json.decode(data);
  }

  getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool? data = prefs.getBool(key);

    return (data == null) ? null : data;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  saveBool(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
