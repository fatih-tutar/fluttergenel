import 'package:flutter/material.dart';

class bolum26 extends StatefulWidget {
  @override
  _bolum26State createState() => _bolum26State();
}

class _bolum26State extends State<bolum26> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 26"),
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
                    onTap: () => Navigator.pushNamed(context, "/login_islemleri"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("153"),
                    subtitle: Text("Login İşlemleri"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/firestore_islemleri"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("161"),
                    subtitle: Text("Firestore İşlemleri"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
