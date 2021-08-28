import 'package:flutter/material.dart';
import 'package:rider/decorations/Input.dart';

TextFormField MobileNoField(isPhoneValid,onChanged){
  return TextFormField(
    initialValue: '01740963472',
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.phone,
    onChanged: onChanged,
    validator: (phone) {
      if (isPhoneValid(phone!))
        return null;
      else
        return 'Enter a valid mobile number';
    },
    decoration: InputTextDecoreation(
        icon: Icon(Icons.person),
        label: 'Enter Your Mobile Number'),
  );
}

TextFormField PasswordField(hidePassword,onChanged,onPressed){
  return TextFormField(
    initialValue: '12345678',
    obscureText: hidePassword,
    keyboardType: TextInputType.visiblePassword,
    onChanged: onChanged,
    validator: (password) {
      if (password!.length > 6)
        return null;
      else
        return 'Invalid Password';
    },
    decoration: InputTextDecoreation(
      icon: Icon(Icons.lock),
      label: 'Enter Your Password',
      suffixIcon: IconButton(
        icon: Icon(
          hidePassword ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: onPressed,
      ),
    ),
  );
}