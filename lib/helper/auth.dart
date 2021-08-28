import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

localLogin(user, token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedin', true);
  prefs.setString('user', jsonEncode(user));
  prefs.setString('token', token);
}

localLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedin', false);
  prefs.setBool('hasCard', false);
  prefs.setString('user', "");
  prefs.setString('token', "");
}

localGetUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return jsonDecode(prefs.getString('user').toString());
}

localSetUser(user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user', jsonEncode(user));
}


setUpdateInfo(forceUpdate, forceMessage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('forceUpdate', forceUpdate);
  prefs.setString('forceMessage', forceMessage);
}

getUpdateInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return {
    "forceUpdate": prefs.getBool('forceUpdate') != null
        ? prefs.getBool('forceUpdate')
        : false,
    "forceMessage": prefs.getString('forceMessage') != null
        ? prefs.getString('forceMessage')
        : ""
  };
}

localGetProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return jsonDecode(prefs.getString('profile').toString());
}

localGetToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

localIsLoggedIn() async {
  print('--------------------------');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs);
  print('####################');
}

Future<String?> read_loggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  print(prefs);
}