import 'package:flutter/material.dart';
import 'package:rider/const/colors.dart';

InputDecoration InputTextDecoreation({label,icon,suffixIcon}){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: accentColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
      ),
      border: OutlineInputBorder(),
      labelText: label,
      labelStyle: TextStyle(
        color: accentColor
      ),
      prefixStyle: TextStyle(
          color: accentColor
      ),
      contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      prefixIcon:icon,
      suffixIcon: suffixIcon
  );
}