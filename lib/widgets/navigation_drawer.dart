import 'package:flutter/material.dart';
import 'package:rider/const/colors.dart';
import 'package:rider/screen/homePage.dart';
import 'package:rider/utils/Navigation.dart';

class NavigationDrawer extends StatelessWidget {
  final String currentPage;

  NavigationDrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: bgColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://st.depositphotos.com/2101611/4338/v/600/depositphotos_43381243-stock-illustration-male-avatar-profile-picture.jpg'),
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text('Md. Hasan Kabir'),
                      Text('01740963472'),
                    ],
                  )
                ],
              ),
            ),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                isActive: currentPage == Navigation.HOME_PAGE,
                onClicked: () {
                  selectedItem(
                      context, HomePage(), currentPage == Navigation.HOME_PAGE);
                }),
            Divider(color: appColor, thickness: 1),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      bool isActive = false,
      VoidCallback? onClicked}) {
    return ListTile(
      tileColor: isActive ? appColor : bgColor,
      title: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.grey),
      ),
      leading: Icon(
        icon,
        color: isActive ? bgColor : Colors.grey,
      ),
      hoverColor: appColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, page, bool isCurrentPage) {
    Navigator.of(context).pop();
    if (!isCurrentPage) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => page,
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    }
  }
}
