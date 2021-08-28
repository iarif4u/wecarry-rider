import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/screen/payment_collect.dart';
import 'package:rider/widgets/order_row.dart';
import 'package:rider/widgets/summery_row.dart';

class OrderSummery extends StatelessWidget {
  Order order;

  OrderSummery({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Summery',
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
            Material(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summery',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SummeryRow(
                      summery:  'Service Type: Quick delivery',
                      amount:  '220',
                    ),
                    SummeryRow(
                      summery:  'Product Weight 3X 30',
                      amount:  '18',
                    ),
                    SummeryRow(
                      summery:  'Area- Pickup zone to Delivery Zone (Agrabad to GEC)',
                      amount:  '30',
                    ),
                    SummeryRow(
                      summery:  'Product Weight',
                      amount:  '30',
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    SummeryRow(
                      summery:  'Subtotal',
                      amount:  '210',
                    ),
                    SummeryRow(
                      summery:  'Coupon Code',
                      amount:  '-30',
                    ),
                    SummeryRow(
                      summery:  'Total',
                      amount:  '180',
                    ),
                    SummeryRow(
                      summery:  'COD Amount',
                      amount:  '930',
                    ),
                    SummeryRow(
                      summery:  'Customer Payable',
                      amount:  '110',
                      rowColor: Colors.orange,
                    ),
                  ],
                ),
              ),
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
                        builder: (builder) => PaymentCollect(order: order,)));
              },
              child: Text(
                'Payment Collect',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
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
        ),
      ),
    );
  }
}
