import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/about_screen.dart';
import 'package:flutter_complete_guide/screens/restaurant_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,
      [Null Function()? tapHandler]) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'תפריט',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('רשימת מסעדות', Icons.restaurant, () {
            Navigator.of(context)
                .pushReplacementNamed(RestaurantScreen.routeName);
          }),
          buildListTile('מי אנחנו', Icons.info, () {
            Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
          }),
          buildListTile('תרמו לתנועה', Icons.attach_money, () {
            const url =
                'https://www.jgive.com/new/he/ils/external/charity-organizations/431';
            //if (await canLaunch(url)) {
            launch(url, forceWebView: true);
          }),
        ],
      ),
    );
  }
}
