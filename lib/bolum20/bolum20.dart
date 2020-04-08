import 'package:flutter/material.dart';

class bolum20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 20"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/drawer_bottom_navigation_bar"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("109 - 110 - 111"),
                    subtitle: Text("Drawer ve Bottom Navigation Bar Kullanımı"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
