import 'package:flutter/material.dart';

class IconInfo extends StatelessWidget {
  IconData _iconData;
  String _title;
  String _info;
  Color _iconColor;
  bool _hasBorder = true;

  IconInfo(this._iconData, this._title, this._info, this._iconColor,
      [this._hasBorder = true]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: _hasBorder ?BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ) : null,
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(
              _iconData,
              color: _iconColor,
              size: 30,
            ),
            backgroundColor: Colors.grey[200],
            radius: 25,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                _info,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
