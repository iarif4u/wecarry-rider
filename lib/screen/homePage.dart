import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/helper/custom_tabbar.dart';
import 'package:rider/utils/Navigation.dart';
import 'package:rider/widgets/navigation_drawer.dart';
import 'package:rider/widgets/order_list.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    print('-----------');

    print(data["items"]);
    print('#############3');
    setState(() {
      _items = data["items"];
    });
    // ...
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Image.asset('assets/img/title_logo.png'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  "assets/img/toggle.svg",
                  height: 17,
                  width: 20,
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                labelColor: accentColor,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Ongoing"),
                  Tab(text: "Pickup"),
                  Tab(text: "Done"),
                  Tab(text: "Tab5"),
                  Tab(text: "Tab6"),
                  Tab(text: "Tab7"),
                  Tab(text: "Tab8"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: TabBarView(
                  controller: _tabController,
                  //physics: NeverScrollableScrollPhysics(),
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                    Container(
                      child: OrderList(currentPage: Navigation.HOME_PAGE, items: _items,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(
          currentPage: Navigation.HOME_PAGE,
        ),
      ),
    );
  }
}
