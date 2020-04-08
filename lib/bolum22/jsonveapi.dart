import 'package:burc_rehberi/bolum22/models/araba.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Ogrenci{
  int id;
  String isim;
  Ogrenci(this.id, this.isim);
  @override
  String toString() {
    // TODO: implement toString
    return "Adı : $isim id: $id";
  }
  factory Ogrenci.mapiNesneyeDonustur(Map<String, dynamic> gelenMap){
   return Ogrenci(gelenMap['id'],gelenMap['isim']);
  }
  Ogrenci.fromMap(Map<String, dynamic> gelenMap):
      id = gelenMap['id'],
      isim = gelenMap['isim'];
}

class JsonveApi extends StatefulWidget {
  @override
  _JsonveApiState createState() => _JsonveApiState();

}

class _JsonveApiState extends State<JsonveApi> {
  List<Araba> tumArabalar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });*/
    Ogrenci fatih = Ogrenci(10,"Fatih");
    debugPrint(fatih.toString());
    Map<String, dynamic> hasanMap = {'id' : 15, 'isim' : "hasan"};
    debugPrint("Adı : "+hasanMap['isim']+"id : "+hasanMap['id'].toString());

    Ogrenci yeni = Ogrenci.mapiNesneyeDonustur(hasanMap);
    debugPrint(yeni.toString());

    Map<String, dynamic> fatmaMap = {'id' : 20, 'isim' : "fatma"};
    Ogrenci fatma = Ogrenci.fromMap(fatmaMap);
    debugPrint(fatma.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future: veriKaynaginiOku(),
              builder: (context, sonuc) {
                if (sonuc.hasData) {
                  tumArabalar = sonuc.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tumArabalar[index].araba_adi),
                        subtitle: Text(tumArabalar[index].ulke),
                      );
                    },
                    itemCount: tumArabalar.length,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: tumArabalar != null ? Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context,index){
            return ListTile(
              title: Text(tumArabalar[index]["araba_adi"]),
              subtitle: Text(tumArabalar[index]["ulke"]),
            );
          }, itemCount: tumArabalar.length,),
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }*/
  Future<List<Araba>> veriKaynaginiOku() async {
    /*Future<String> jsonOku = DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    jsonOku.then((okunanJson){
      debugPrint("Gelen json : " + okunanJson);
      return okunanJson;
    });*/
    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    //debugPrint(gelenJson);
    List<Araba> arabaListesi = (json.decode(gelenJson) as List).map((mapYapisi) => Araba.fromJsonMap(mapYapisi)).toList();

    //debugPrint("Toplam araba sayısı : " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      //debugPrint("Markalar : " + arabaListesi[i].araba_adi.toString());
      //debugPrint("Ülkesi : " + arabaListesi[i].ulke.toString());
    }
    return arabaListesi;
  }
}