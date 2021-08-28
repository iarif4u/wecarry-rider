import 'package:flutter/material.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/screen/loginPage.dart';
import 'package:rider/utils/Routers.dart';
import 'helper/auth.dart';

Future<void> main() async {
  var isLoggedIn = await read_loggedIn();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeCarry Delivery Boy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primarySwatchColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: bgColor,
          iconTheme: IconThemeData(color: Colors.black),
        )
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}