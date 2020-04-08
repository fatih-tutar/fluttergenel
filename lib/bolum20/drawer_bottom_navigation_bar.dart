import 'package:burc_rehberi/bolum20/arama.dart';
import 'package:burc_rehberi/bolum20/page_view.dart';
import 'package:burc_rehberi/bolum20/tabs.dart';
import 'package:burc_rehberi/template/drawer_menu.dart';
import 'package:flutter/material.dart';

import 'ana_sayfa.dart';

class drawer_bottom_navigation_bar extends StatefulWidget {
  @override
  _drawer_bottom_navigation_barState createState() => _drawer_bottom_navigation_barState();
}

class _drawer_bottom_navigation_barState extends State<drawer_bottom_navigation_bar> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar;
  Ana_Sayfa sayfaAna;
  AramaSayfasi sayfaArama;
  PageViewOrnek pageViewOrnek;
  var keyAnaSayfa = PageStorageKey("key_ana_sayfa");
  var keyArama = PageStorageKey("key_arama_sayfa");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaAna = Ana_Sayfa(keyAnaSayfa);
    sayfaArama = AramaSayfasi(keyArama);
    pageViewOrnek = PageViewOrnek();
    tumSayfalar = [sayfaAna, sayfaArama, pageViewOrnek];
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Genel',
        primarySwatch: Colors.cyan,
      ),
      child: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: Text("Drawer ve Bottom Navigation Bar"),
        ),
        body: secilenMenuItem<= tumSayfalar.length-1 ? tumSayfalar[secilenMenuItem]: tumSayfalar[0],
        bottomNavigationBar: bottomNavMenu(),
      ),
    );
  }

  BottomNavigationBar bottomNavMenu() {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Ana Sayfa"),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.call),
              title: Text("Ara"),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              activeIcon: Icon(Icons.done),
              title: Text("Page View"),
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text("Tablar"),
              backgroundColor: Colors.brown),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: secilenMenuItem,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
            if(index == 3){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabOrnek())).then((b){
                secilenMenuItem = 0;
              });
            }
          });
        },
      );
  }
}