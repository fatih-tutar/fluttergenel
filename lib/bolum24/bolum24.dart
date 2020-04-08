import 'package:flutter/material.dart';

class bolum24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 24"),
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
                    onTap: () => Navigator.pushNamed(context, "/shared_pref_kullanimi"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("131 - 132"),
                    subtitle: Text("Shared Preferences Kullanımı"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/dosya_islemleri"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("133"),
                    subtitle: Text("Yerel Dosya İşlemleri"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/sqflite"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("134"),
                    subtitle: Text("Sqflite Kütüphanesi"),
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
