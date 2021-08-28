import 'package:flutter/material.dart';
import 'package:rider/models/order.dart';
import 'package:rider/models/order_data.dart';
import 'package:rider/screen/order_details.dart';

class OrderList extends StatelessWidget {
  final String currentPage;
  List items = [];

  OrderList({Key? key, required this.currentPage, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return items.length > 0
        ? ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetails(
                          order: Order(
                              items[index]["id"].toString(),
                              items[index]["date"].toString(),
                              items[index]["zone"].toString(),
                              items[index]["taka"].toString(),
                              items[index]["status"].toString(),
                              OrderData(
                                  'Pickup Information',
                                  'Minhajur Rahman',
                                  '01740589635',
                                  'House: 52, Road: 1, GEC',
                                  'GEC'),
                              OrderData(
                                  'Delivery Information',
                                  'Nannu Rahman',
                                  '01640589635',
                                  'House: 01, Road: 05, CTG',
                                  'GEC'))),
                    ),
                  );
                },
                child: OrderTile(
                  id: items[index]["id"].toString(),
                  date: items[index]["date"].toString(),
                  zone: items[index]["zone"].toString(),
                  taka: items[index]["taka"].toString(),
                  status: items[index]["status"].toString(),
                ),
              );
            },
          )
        : Container(
            child: Text(items.length.toString()),
          );
  }

  Widget OrderTile({
    required String id,
    required String date,
    required String zone,
    required String taka,
    required String status,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: $id",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Text("Placed on $date", style: TextStyle(color: Colors.grey)),
              Text("Zone: $zone",
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              Text(
                "Payment: \$ $taka",
                style: TextStyle(color: Colors.purple),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrangeAccent),
            child: Text(
              status,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
