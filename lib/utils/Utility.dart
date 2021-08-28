import 'package:flutter/services.dart';
import 'package:rider/const/colors.dart';

void updateStatusBar(barColor){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: barColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}