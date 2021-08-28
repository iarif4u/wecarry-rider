import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/screen/order_summery.dart';
import 'package:rider/widgets/order_info.dart';
import 'package:rider/widgets/order_row.dart';

class DeliveryInfo extends StatelessWidget {
  Order order;

  DeliveryInfo({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delivery Information',
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
                        builder: (builder) => OrderSummery(order: order)));
              },
              child: Text(
                'Delivery Done',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.tune_outlined,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      'Reschedule',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings_backup_restore_outlined,
                      color: Colors.green,
                    ),
                    Text(
                      'Returned',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
