import 'package:flutter/material.dart';
import 'package:rider/screen/forgetPasswordPage.dart';
import 'package:rider/screen/homePage.dart';
import 'package:rider/screen/loginPage.dart';
import 'package:rider/screen/order_details.dart';
import 'package:rider/screen/registerPage.dart';
import 'package:rider/utils/Navigation.dart';

final Map<String, WidgetBuilder> routes = {
  //front routes
  Navigation.LOGIN: (context) => LoginPage(),
  Navigation.FORGOT_PASSWORD: (context) => ForgetPasswordPage(),
  Navigation.REGISTER: (context) => RegisterPage(),
  Navigation.HOME_PAGE: (context) => HomePage(),
};