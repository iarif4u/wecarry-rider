import 'package:flutter/material.dart';

class SummeryRow extends StatelessWidget {
  String summery;
  String amount;
  Color? rowColor = ThemeData().textTheme.bodyText1!.color;

  SummeryRow({required this.amount, required this.summery, Key? key, this.rowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              summery,
              style: TextStyle(fontSize: 18, color: rowColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('$amount/=', style: TextStyle(fontSize: 18, color: rowColor),textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }
}
