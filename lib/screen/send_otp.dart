import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/screen/order_summery.dart';
import 'package:rider/screen/otp.dart';
import 'package:rider/widgets/order_info.dart';
import 'package:rider/widgets/order_row.dart';

class SendOTP extends StatelessWidget {
  Order order;

  SendOTP({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send OTP',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OrderRow(order.getId(), order.getDate()),
            SizedBox(
              height: 15,
            ),
            Text(
              'Customer Number: 01676966260',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              'Customer Send To OTP Code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 40),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => Otp(email: 'iarif4u@gmail.com',isGuestCheckOut: true, newEmail: 'arif@polash.com')
                    )
                );
              },
              child: Text(
                'Delivery Done',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
