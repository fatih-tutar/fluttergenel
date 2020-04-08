import 'package:burc_rehberi/bolum24/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'model/ogrenci.dart';

class SqfliteKullanimi extends StatefulWidget {
  @override
  _SqfliteKullanimiState createState() => _SqfliteKullanimiState();
}

class _SqfliteKullanimiState extends State<SqfliteKullanimi> {
  DatabaseHelper databaseHelper;
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String isim = "";
  int aktiflik = 0;
  int id = 0;
  int tiklanilanListeID = 0;
  List<Ogrenci> tumOgrenciListesi;
  var _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumOgrenciListesi = List<Ogrenci>();
    databaseHelper = DatabaseHelper();
    databaseHelper.tumOgrenciler().then((mapListesi) {
      for (Map okunanMap in mapListesi) {
        tumOgrenciListesi.add(Ogrenci.fromMap(okunanMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Sqflite Kullanımı"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controller,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Öğrenci ismini giriniz.",
                        border: OutlineInputBorder(),
                      ),
                      validator: (girilenDeger) {
                        if (girilenDeger.length < 3) {
                          return "En az 3 karakter giriniz";
                        }
                      },
                      onSaved: (girilenIsim) {
                        isim = girilenIsim;
                      },
                    ),
                  ),
                  SwitchListTile(
                    title: Text("Aktif"),
                    value: aktiflik == 1 ? true : false,
                    onChanged: (aktifMi) {
                      setState(() {
                        aktiflik = aktifMi == true ? 1 : 0;
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Kaydet"),
                  color: Colors.green,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      _ogrenciEkle(Ogrenci(isim, aktiflik));
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Güncelle"),
                  color: Colors.yellow,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      _ogrenciGuncelle(Ogrenci.withID(id, isim, aktiflik), tiklanilanListeID);
                    }
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    _tumOgrenciKayitlariniSil();
                  },
                  color: Colors.red,
                  child: Text("Tüm Tabloyu Sil"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tumOgrenciListesi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: tumOgrenciListesi[index].aktif == 1
                          ? Colors.green.shade200
                          : Colors.red.shade200,
                      child: ListTile(
                        onTap: (){
                          setState(() {
                            isim = tumOgrenciListesi[index].isim;
                            aktiflik = tumOgrenciListesi[index].aktif;
                            id = tumOgrenciListesi[index].id;
                            tiklanilanListeID = index;
                            _controller.text = isim;
                          });
                        },
                        title: Text(tumOgrenciListesi[index].isim),
                        subtitle: Text(tumOgrenciListesi[index].id.toString()),
                        trailing: GestureDetector(
                          onTap: (){
                            databaseHelper.ogrenciSil(tumOgrenciListesi[index].id).then((silinenId){
                              setState(() {
                                tumOgrenciListesi.removeAt(index);
                              });
                            });
                          },
                          child: Icon(Icons.delete),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _ogrenciEkle(Ogrenci ogrenci) async {
    await databaseHelper.ogrenciEkle(ogrenci).then((eklenenInt) {
      setState(() {
        ogrenci.id = eklenenInt;
        tumOgrenciListesi.insert(0, ogrenci);
      });
    });
  }

  void _tumOgrenciKayitlariniSil() async {
    await databaseHelper.tumOgrenciTablosunuSil().then((silinenElemanSayisi){
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(silinenElemanSayisi.toString() + " kayıt silindi."),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        tumOgrenciListesi.clear();
      });
    });
  }

  _ogrenciGuncelle(Ogrenci ogrenci, int tiklanilanListeID) async {
    await databaseHelper.ogrenciGuncelle(ogrenci).then((guncellenenInt) {
      setState(() {
        tumOgrenciListesi[tiklanilanListeID] = ogrenci;
      });
    });
  }
}
