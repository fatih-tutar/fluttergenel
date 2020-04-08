import 'package:burc_rehberi/bolum26/bolum26.dart';
import 'package:burc_rehberi/bolum26/firestore_islemleri.dart';
import 'package:burc_rehberi/bolum26/giris.dart';
import 'package:burc_rehberi/bolum26/login_islemleri.dart';
import 'package:burc_rehberi/bolum26/profilsayfasi.dart';
import 'package:burc_rehberi/bolum26/uyeol.dart';
import 'package:burc_rehberi/burcuygulamasi/burc_detay.dart';
import 'package:burc_rehberi/moda/moda.dart';
import 'package:burc_rehberi/bolum18/stepper_kullanimi.dart';
import 'package:burc_rehberi/bolum18/text_field_ozellikleri.dart';
import 'package:burc_rehberi/notsepeti/notsepeti.dart';
import 'package:burc_rehberi/pokemon/pokemon_list.dart';
import 'package:flutter/material.dart';
import 'package:burc_rehberi/burcuygulamasi/burc_liste.dart';
import 'package:burc_rehberi/anasayfa.dart';
import 'bolum18/bolum18.dart';
import 'bolum18/date_time_picker.dart';
import 'bolum20/bolum20.dart';
import 'bolum20/drawer_bottom_navigation_bar.dart';
import 'bolum22/bolum22.dart';
import 'bolum22/jsonveapi.dart';
import 'bolum22/remoteapi.dart';
import 'bolum24/bolum24.dart';
import 'bolum24/dosya_islemleri.dart';
import 'bolum24/shared_pref_kullanimi.dart';
import 'bolum24/sqflite_kullanimi.dart';
import 'deviriskat/deviriskat.dart';
import 'bolum18/formverikontrolvekayit.dart';
import 'bolum18/checkboxsliderradioswitch.dart';
import 'notortalamasi/not_ortalamasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "anaSayfa",

      routes: {
        "/" : (context) => AnaSayfa(),
        "anaSayfa" : (context) => AnaSayfa(),
        "/burcListesi" : (context) => BurcListesi(),
        "/textFieldIslemleri" : (context) => TextFieldIslemleri(),
        "/bolum18" : (context) => bolum18(),
        "/formverikontrolvekayit" : (context) => formverikontrolvekayit(),
        "/checkboxsliderradioswitch" : (context) => checkboxsliderradioswitch(),
        "/TarihSaatOrnek" : (context) => TarihSaatOrnek(),
        "/Stepper_Kullanimi" : (context) => Stepper_Kullanimi(),
        "/notOrtalamasi" : (context) => NotOrtalamasi(),
        "/devirIskat" : (context) => DevirIskat(),
        "/bolum20" : (context) => bolum20(),
        "/drawer_bottom_navigation_bar" : (context) => drawer_bottom_navigation_bar(),
        "/moda" : (context) => ModaApp(),
        "/jsonveapi" : (context) => JsonveApi(),
        "/bolum22" : (context) => bolum22(),
        "/bolum24" : (context) => bolum24(),
        "/remoteapi" : (context) => RemoteApi(),
        "/pokemonlist" : (context) => PokemonList(),
        "/shared_pref_kullanimi" : (context) => SharedPrefKullanimi(),
        "/dosya_islemleri" : (context) => DosyaIslemleri(),
        "/sqflite" : (context) => SqfliteKullanimi(),
        "/notsepeti" : (context) => NotSepeti(),
        "/bolum26" : (context) => bolum26(),
        "/login_islemleri" : (context) => LoginIslemleri(),
        "/uyeol" : (context) => UyeOl(),
        "/giris" : (context) => Giris(),
        "/profilsayfasi" : (context) => ProfilSayfasi(),
        "/firestore_islemleri" : (context) => FirestoreIslemleri(),
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1] == 'burcDetay'){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      //home: BurcListesi(),
    );
  }
}
