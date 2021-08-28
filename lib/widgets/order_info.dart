import 'package:flutter/material.dart';
import 'package:rider/models/order_data.dart';
import 'package:rider/widgets/icon_info.dart';

class OrderInfo extends StatelessWidget {
  final OrderData orderData;
  const OrderInfo({Key? key,  required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             orderData.getTitle(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            IconInfo(Icons.person, 'Contact Person', orderData.getPerson(),Colors.green),
            IconInfo(Icons.phone, 'Mobile',orderData.getMobile(),Colors.indigoAccent),
            IconInfo(Icons.map, 'Address', orderData.getAddress(),Colors.deepPurpleAccent),
            IconInfo(Icons.location_on_outlined, orderData.getZone(), 'GEC',Colors.deepOrange, false),
          ],
        ),
      ),
    );
  }
}
