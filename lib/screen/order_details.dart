import 'package:flutter/material.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/models/order.dart';
import 'package:rider/models/order_data.dart';
import 'package:rider/screen/pickup_info.dart';
import 'package:rider/widgets/icon_info.dart';
import 'package:rider/widgets/order_info.dart';
import 'package:rider/widgets/order_row.dart';

class OrderDetails extends StatelessWidget {
  Order order;

  OrderDetails({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
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
            SizedBox(
              height: 15,
            ),
            OrderInfo(orderData: order.getDeliveryInfo()),
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
                        builder: (builder) => PickupInfo(order: order)));
              },
              child: Text(
                'Order Continue',
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
