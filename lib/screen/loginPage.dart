import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/utils/Navigation.dart';
import 'package:rider/utils/Utility.dart';
import 'package:rider/utils/validators.dart';
import 'package:rider/widgets/FieldWidgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  String contactNo = '';
  String password = '';
  String message = 'Welcome';
  int _pageStatue = 0;
  final formGlobalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    updateStatusBar(bgColor);
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
                duration: Duration(
                  milliseconds: 300
                ),
                child: Form(
                  key: formGlobalKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      MobileNoField(isPhoneValid, (value) {
                        contactNo = value;
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      PasswordField(hidePassword, (val) {
                        password = val;
                      }, () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // use the email provided here
                            Navigator.pushNamed(context, Navigation.HOME_PAGE);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(primary: accentColor, elevation: 3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, Navigation.FORGOT_PASSWORD),
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                  color: skyBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, Navigation.REGISTER),
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
