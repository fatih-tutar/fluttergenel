import 'package:flutter/material.dart';
import 'dart:math';

class DevirIskat extends StatefulWidget {
  @override
  _DevirIskatState createState() => _DevirIskatState();
}

class _DevirIskatState extends State<DevirIskat> {
  var formKey = GlobalKey<FormState>();
  int altinSayisi = 0,
      kisiSayisi = 0,
      namazDevir = 0,
      kalanNamazDevir = 0,
      namazVerilenAltin = 0,
      namazVerilecekAltin = 0,
      orucDevir = 0,
      kalanOrucDevir = 0,
      orucVerilenAltin = 0,
      orucVerilecekAltin = 0;
  int secilenYil = DateTime.now().year - 9;
  int buYil = DateTime.now().year;
  String cinsiyet = "";
  String sonuc = "", kalan = "", _kisiSayisi = "", _altinSayisi = "";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.amber,
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            "Devir İskat Hesaplama",
            style:TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return uygulamaGovdesi();
          } else {
            return uygulamaGovdesiLandscape();
          }
        }),
      ),
    );
  }

  Widget uygulamaGovdesi() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //color: Colors.pink.shade200,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Kişi Sayısı",
                              hintText:
                                  "Devire katılan fakir kişi sayısını giriniz.",
                              hintStyle: TextStyle(fontSize: 18),
                              labelStyle: TextStyle(fontSize: 22),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.amber, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2)),
                            ),
                            onSaved: (deger) => _kisiSayisi = deger,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Altın Sayısı",
                              hintText:
                                  "Buraya elinizdeki altın sayısını giriniz.",
                              hintStyle: TextStyle(fontSize: 18),
                              labelStyle: TextStyle(fontSize: 22),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.amber, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2)),
                            ),
                            onSaved: (deger) => _altinSayisi = deger,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.amber, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    items: yillarItems(),
                                    value: secilenYil,
                                    onChanged: (sectigimYil) {
                                      setState(() {
                                        secilenYil = sectigimYil;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          RadioListTile<String>(
                            value: "Erkek",
                            groupValue: cinsiyet,
                            onChanged: (deger) {
                              setState(() {
                                cinsiyet = deger;
                              });
                            },
                            title: Text("Erkek",style: TextStyle(fontSize:20,fontWeight:FontWeight.w500,color: Colors.amber.shade700)),
                            //subtitle: Text("Radio Subtitle"),
                            //secondary: Icon(Icons.map),
                          ),
                          RadioListTile<String>(
                            value: "Kadın",
                            groupValue: cinsiyet,
                            onChanged: (deger) {
                              setState(() {
                                cinsiyet = deger;
                              });
                            },
                            title: Text("Kadın",style: TextStyle(fontSize:20,fontWeight:FontWeight.w500,color:Colors.amber.shade700)),
                            //subtitle: Text("Radio Subtitle"),
                            //secondary: Icon(Icons.map),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 40,
                                  width:120,
                                  child: RaisedButton(
                                    onPressed: devriHesapla,
                                    disabledColor: Colors.amber,
                                    color: Colors.amber,
                                    child: Text("Hesapla",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 40,
                                  width:120,
                                  child: RaisedButton(
                                    onPressed: devriGuncelle,
                                    disabledColor: Colors.amber,
                                    color: Colors.amber,
                                    child: Text("Güncelle",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 40,
                                  width:120,
                                  child: RaisedButton(
                                    onPressed: devriSifirla,
                                    disabledColor: Colors.amber,
                                    color: Colors.amber,
                                    child: Text("Sıfırla",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: BorderDirectional(
                          top: BorderSide(color: Colors.amber, width: 2),
                          //bottom: BorderSide(color: Colors.amber, width: 2),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: namazDevirAzalt,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 50,
                                  color: Colors.black,
                                ),
                                disabledColor: Colors.amber,
                                color: Colors.amber,
                                label: Text(kalanNamazDevir == 0 ? "Namaz" : "Namaz : $kalanNamazDevir",style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: orucDevirAzalt,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 50,
                                  color: Colors.black,
                                ),
                                disabledColor: Colors.amber,
                                color: Colors.amber,
                                label: Text(kalanOrucDevir == 0 ? "Oruç" : "Oruç : $kalanOrucDevir",style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              flex: 1),
        ],
      ),
    );
  }

  Widget uygulamaGovdesiLandscape() {
    return Container();
  }

  List<DropdownMenuItem<int>> yillarItems() {
    List<DropdownMenuItem<int>> yillar = [];
    int suan = DateTime.now().year - 9;
    for (int i = (suan - 150); i <= suan; i++) {
      yillar.add(DropdownMenuItem<int>(
        value: i,
        child: Text(
          "$i",
          style: TextStyle(fontSize: 20),
        ),
      ));
    }
    return yillar;
  }

  void devriHesapla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      kisiSayisi = int.parse(_kisiSayisi);
      altinSayisi = int.parse(_altinSayisi);
      int yilFark = 0;
      if (cinsiyet == "Erkek") {
        yilFark = buYil - secilenYil - 12;
      } else {
        yilFark = buYil - secilenYil - 9;
      }
      namazVerilecekAltin = yilFark * 60;
      namazDevir = (yilFark * 60 / altinSayisi / kisiSayisi).ceil();
      kalanNamazDevir = namazDevir;
      orucVerilecekAltin = yilFark;
      orucDevir = (yilFark / altinSayisi / kisiSayisi).ceil();
      kalanOrucDevir = orucDevir;
    }
  }

  void devriGuncelle() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      kisiSayisi = int.parse(_kisiSayisi);
      altinSayisi = int.parse(_altinSayisi);
      int yilFark = 0;
      if (cinsiyet == "Erkek") {
        yilFark = buYil - secilenYil - 12;
      } else {
        yilFark = buYil - secilenYil - 9;
      }
      namazVerilecekAltin = yilFark * 60;
      namazVerilecekAltin = namazVerilecekAltin - namazVerilenAltin;
      namazDevir = (namazVerilecekAltin / altinSayisi / kisiSayisi).ceil();
      kalanNamazDevir = namazDevir;
      orucVerilecekAltin = yilFark;
      orucVerilecekAltin = orucVerilecekAltin - orucVerilenAltin;
      orucDevir = (orucVerilecekAltin / altinSayisi / kisiSayisi).ceil();
      kalanOrucDevir = orucDevir;
    }
  }
  void devriSifirla() {
    setState(() {
      altinSayisi = 0;
      kisiSayisi = 0;
      namazDevir = 0;
      kalanNamazDevir = 0;
      namazVerilenAltin = 0;
      namazVerilecekAltin = 0;
      orucDevir = 0;
      kalanOrucDevir = 0;
      secilenYil = DateTime.now().year - 9;
      buYil = DateTime.now().year;
      cinsiyet = "";
      sonuc = "";
      kalan = "";
      _kisiSayisi = "";
      _altinSayisi = "";
    });
  }

  void namazDevirAzalt() {
    if(kalanNamazDevir != 0){
      setState(() {
        namazVerilenAltin += altinSayisi * kisiSayisi;
        debugPrint("$namazVerilenAltin");
        kalanNamazDevir--;
      });
    }
  }
  void orucDevirAzalt() {
    if(kalanOrucDevir != 0){
      orucVerilenAltin += altinSayisi * kisiSayisi;
      setState(() {
        kalanOrucDevir--;
      });
    }
  }
}