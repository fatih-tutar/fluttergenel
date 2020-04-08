import 'package:flutter/material.dart';

class bolum22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 22"),
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
                    onTap: () => Navigator.pushNamed(context, "/jsonveapi"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("121 - 122 - 123 - 124 - 125"),
                    subtitle: Text("Local Json Kullanımı"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/remoteapi"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("126"),
                    subtitle: Text("Remote Api Kullanımı"),
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
