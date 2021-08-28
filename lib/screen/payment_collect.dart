import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/screen/send_otp.dart';
import 'package:rider/widgets/order_row.dart';

class PaymentCollect extends StatelessWidget {
  Order order;

  PaymentCollect({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Collect',
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
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent, width: 1.5),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('1200 TAKA'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 40),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => SendOTP(order: order,)));
              },
              child: Text(
                'Payment Collect Done',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
