import 'package:flutter/material.dart';
import 'package:rider/const/colors.dart';

class OrderRow extends StatelessWidget {
  String _orderId;
  String _date;

  OrderRow(this._date, this._orderId);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order ID: $_orderId',
          style: TextStyle(color: btnGreenColor, fontSize: 18),
        ),
        Text(
          _date,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
