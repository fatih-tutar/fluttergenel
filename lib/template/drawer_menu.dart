import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Fatih Tutar"),
            accountEmail: Text("fatih.tutar@ihlas.com.tr"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308460-stock-illustration-unknown-person-silhouette-profile-picture.jpg"),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage("https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue, child: Text("FT"),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  splashColor: Colors.cyan,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Profil"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Mesajlar"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Ayarlar"),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                AboutListTile(
                  applicationName: "Uygulamalar",
                  applicationIcon: Icon(Icons.flag),
                  applicationVersion: "1.0",
                  child: Text("Hakkımızda"),
                  applicationLegalese: "Flutter Uygulamaları",
                  icon: Icon(Icons.keyboard),
                  aboutBoxChildren: <Widget>[
                    Text("Child 1"),
                    Text("Child 2"),
                    Text("Child 3"),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text("Ürünler"),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Adres"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.call),
                  title: Text("İletişim"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text("SSS"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
