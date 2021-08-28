import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/decorations/Input.dart';
import 'package:rider/utils/Navigation.dart';
import 'package:rider/utils/Utility.dart';
import 'package:rider/utils/validators.dart';
import 'package:rider/widgets/FieldWidgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidePassword = true;
  String contactNo = '';
  String fullName = '';
  String password = '';
  String email = '';
  String nidNumber = '';
  String address = '';
  String message = 'Welcome';
  int _pageStatue = 0;
  final formGlobalKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/img/mainlogo.png'),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: accentColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: Form(
                  key: formGlobalKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          contactNo = value;
                        },
                        validator: (value) {
                          if (value!.length > 0) {
                            return null;
                          } else {
                            return 'Full name is invalid';
                          }
                        },
                        decoration: InputTextDecoreation(
                            icon: Icon(Icons.person), label: 'Full Name'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          contactNo = value;
                        },
                        validator: (value) {
                          if (value!.length == 11) {
                            return null;
                          } else {
                            return 'Mobile number is invalid';
                          }
                        },
                        decoration: InputTextDecoreation(
                            icon: Icon(Icons.phone), label: 'Mobile Number'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          contactNo = value;
                        },
                        validator: (email) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email!);
                          if (emailValid) {
                            return null;
                          } else {
                            return 'Email address is invalid';
                          }
                        },
                        decoration: InputTextDecoreation(
                            icon: Icon(Icons.alternate_email),
                            label: 'Email Address'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: hidePassword,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (val) {
                          password = val;
                        },
                        validator: (password) {
                          if (password!.length > 6)
                            return null;
                          else
                            return 'Invalid Password';
                        },
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focus);
                        },
                        decoration: InputTextDecoreation(
                          icon: Icon(Icons.lock),
                          label: 'Enter Your Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        focusNode: focus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          nidNumber = value;
                        },
                        validator: (nid) {
                          if (nid!.length > 10) {
                            return null;
                          } else {
                            return 'NID number is invalid';
                          }
                        },
                        decoration: InputTextDecoreation(
                            icon: Icon(Icons.art_track), label: 'NID Number'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          address = value;
                        },
                        validator: (address) =>
                            address!.length > 0 ? null : 'Address is invalid',
                        decoration: InputTextDecoreation(
                            icon: Icon(Icons.location_city), label: 'Address'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            Navigator.pushNamed(context, Navigation.HOME_PAGE);
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: accentColor, elevation: 3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, Navigation.FORGOT_PASSWORD),
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                  color: skyBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, Navigation.REGISTER),
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: greenColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
