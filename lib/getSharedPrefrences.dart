
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getSharedPrefrences(key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(key);
}