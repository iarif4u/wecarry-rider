import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/screen/delivery_info.dart';
import 'package:rider/widgets/order_info.dart';
import 'package:rider/widgets/order_row.dart';

class PickupInfo extends StatelessWidget {
  Order order;

  PickupInfo({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pickup Information',
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
            OrderInfo(orderData: order.getPickupInfo()),
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
                        builder: (builder) => DeliveryInfo(order: order)));
              },
              child: Text(
                'Pickup Done',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
