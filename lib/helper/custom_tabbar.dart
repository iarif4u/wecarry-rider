import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  TabItem(title: "Tab1"),
                  TabItem(title: "Tab2"),
                  TabItem(title: "Tab3"),
                  TabItem(title: "Tab4"),
                  TabItem(title: "Tab5"),
                  TabItem(title: "Tab6"),
                  TabItem(title: "Tab7"),
                  TabItem(title: "Tab8"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: Center(child: Text("Page 1")),
                    ),
                    Container(
                      child: Center(child: Text("Page 2")),
                    ),
                    Container(
                      child: Center(child: Text("Page 3")),
                    ),
                    Container(
                      child: Center(child: Text("Page 4")),
                    ),
                    Container(
                      child: Center(child: Text("Page 5")),
                    ),
                    Container(
                      child: Center(child: Text("Page 6")),
                    ),
                    Container(
                      child: Center(child: Text("Page 7")),
                    ),
                    Container(
                      child: Center(child: Text("Page 8")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: Color(0xFF00afb4), width: 1),
          ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
