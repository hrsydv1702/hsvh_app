import 'package:flutter/material.dart';
import 'package:hsvh_test/auth_service.dart';

class AppDrawer extends StatelessWidget {
  final Function changeURL;
  AppDrawer(this.changeURL);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'Applore',
              style: TextStyle(
                fontFamily: 'Titillium Web',
                fontSize: 25,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.run_circle),
            title: Text(
              'Sports',
              style: TextStyle(
                fontFamily: 'Titillium Web',
                fontSize: 20,
              ),
            ),
            onTap: () {
              changeURL(
                  "https://www.ticketmaster.de/category/sport-tickets/10004");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              'Comedy Events',
              style: TextStyle(
                fontFamily: 'Titillium Web',
                fontSize: 20,
              ),
            ),
            onTap: () {
              changeURL(
                  "https://www.ticketmaster.de/comedy/mehr-comedy/10102/events");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontFamily: 'Titillium Web',
                fontSize: 20,
              ),
            ),
            onTap: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
