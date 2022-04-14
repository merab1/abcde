import 'package:shared_preferences/shared_preferences.dart';

class Preferences async {
  final prefs = await SharedPreferences.getInstance();
}