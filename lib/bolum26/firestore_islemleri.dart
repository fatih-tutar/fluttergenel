import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreIslemleri extends StatefulWidget {
  @override
  _FirestoreIslemleriState createState() => _FirestoreIslemleriState();
}

class _FirestoreIslemleriState extends State<FirestoreIslemleri> {
  final Firestore _firestore = Firestore.instance;
  File _secilenResim;
  String mesaj = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore İşlemleri"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Veri Ekle"),
                color: Colors.green,
                onPressed: _veriEkle,
              ),
              RaisedButton(
                child: Text("Transaction Ekle"),
                color: Colors.amber,
                onPressed: _transactionEkle,
              ),
              RaisedButton(
                child: Text("Veri Oku"),
                color: Colors.pink,
                onPressed: _veriOku,
              ),
              RaisedButton(
                child: Text("Veri Sil"),
                color: Colors.blue,
                onPressed: _veriSil,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Veri Sorgula"),
                color: Colors.purple,
                onPressed: _veriSorgula,
              ),
              RaisedButton(
                child: Text("Galeriden Storage'a Resim"),
                color: Colors.cyan,
                onPressed: _galeriResimUpload,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Kameradan Storage'a Resim"),
                color: Colors.orange,
                onPressed: _kameraResimUpload,
              ),
              RaisedButton(
                child: Text("Mesajları Temizle"),
                color: Colors.red,
                onPressed: _mesajlariSil,
              ),
            ],
          ),
          Center(
            child: _secilenResim == null
                ? Text("Resim yok")
                : Image.file(_secilenResim),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mesaj),
          ),
        ],
      ),
    );
  }

  void _veriEkle() {
    Map<String, dynamic> fatihEkle = Map();
    fatihEkle['ad'] = "emre updated";
    fatihEkle['lisansMezunu'] = true;
    fatihEkle['okul'] = "YTU";
    _firestore
        .collection("users")
        .document("fatih_tutar")
        .setData(fatihEkle,
            merge:
                true) // var olan alanları silmez değişecekleri değiştirir sadece merge özelliği
        .then((v) {
      setState(() {
        mesaj += "\nFatih eklendi";
      });
    });
    _firestore
        .collection("users")
        .document("hasan_yilmaz")
        .setData({'ad': 'Hasan', 'cinsiyet': 'erkek'}).whenComplete(() {
      setState(() {
        mesaj += "\nHasan eklendi";
      });
    });
    _firestore.document("/users/ayse").setData({"ad": 'ayse'});
    //_firestore.collection("users").add({'ad': 'can', 'yas': 35});
    String yeniKullaniciID =
        _firestore.collection("users").document().documentID;
    debugPrint(
        yeniKullaniciID); //bu yeni oluşturulacak dökümanın idsi bunu kullanabilirsin
    //_firestore
    //  .document("users/$yeniKullaniciID")
    //.setData({'yas': 30, 'userID': '$yeniKullaniciID'});
    _firestore.document("users/fatih_tutar").updateData({
      'okul': 'ITU',
      'yas': 26,
      'eklenme': FieldValue.serverTimestamp(),
      'begeniSayisi': FieldValue.increment(10),
      'para': 900
    }).then((v) {
      setState(() {
        mesaj += "\nfatih güncellendi";
      });
    });
  }

  void _transactionEkle() {
    final DocumentReference fatihRef = _firestore.document("users/fatih_tutar");
    _firestore.runTransaction((Transaction transaction) async {
      DocumentSnapshot fatihData = await fatihRef.get();
      if (fatihData.exists) {
        var fatihinParasi = fatihData.data['para'];
        if (fatihData.data['para'] > 100) {
          await transaction.update(fatihRef, {'para': fatihinParasi - 100});
          await transaction.update(_firestore.document("users/hasan_yilmaz"),
              {'para': FieldValue.increment(100)});
        } else {
          setState(() {
            mesaj += "\nYetersiz bakiye";
          });
        }
      } else {
        setState(() {
          mesaj += "\nFatih dökümanı yok";
        });
      }
    });
  }

  void _veriSil() {
    _firestore.document("users/ayse").delete().then((aa) {
      setState(() {
        mesaj += "\nAyşe silindi";
      });
    }).catchError((e) {
      setState(() {
        mesaj += "\nSilerken hata çıktı";
      });
    });
    _firestore
        .document("users/hasan_yilmaz")
        .updateData({"cinsiyet": FieldValue.delete()}).then((hata) {
      setState(() {
        mesaj += "\nCinsiyet silindi";
      });
    }).catchError((e) {
      setState(() {
        mesaj += "\nCinsiyeti silerken hata çıktı.";
      });
    });
  }

  void _mesajlariSil() {
    setState(() {
      mesaj = "";
    });
  }

  void _veriOku() async {
    // TEK BİR DÖKÜMANIN OKUNMASI
    DocumentSnapshot documentSnapshot =
        await _firestore.document("users/fatih_tutar").get();
    setState(() {
      mesaj += "\nDöküman ID : " + documentSnapshot.documentID;
      mesaj += "\nDöküman var mı? : " + documentSnapshot.exists.toString();
      mesaj += "\nDöküman string : " + documentSnapshot.toString();
      mesaj += "\nDöküman yazma var mı? : " +
          documentSnapshot.metadata.hasPendingWrites.toString();
      mesaj += "\nCacheden mi geldi? : " +
          documentSnapshot.metadata.isFromCache.toString();
      mesaj += "\nAd : " + documentSnapshot.data['ad'];
      mesaj += "\nPara : " + documentSnapshot.data['para'].toString();
      mesaj += "\nDöküman ID : " + documentSnapshot.documentID;
      mesaj += "\nDöküman var mı? : " + documentSnapshot.exists.toString();
      mesaj += "\nDöküman string : " + documentSnapshot.toString();
      mesaj += "\nDöküman yazma var mı? : " +
          documentSnapshot.metadata.hasPendingWrites.toString();
      mesaj += "\nCacheden mi geldi? : " +
          documentSnapshot.metadata.isFromCache.toString();
      mesaj += "\nAd : " + documentSnapshot.data['ad'];
      mesaj += "\nPara : " + documentSnapshot.data['para'].toString();
    });
    documentSnapshot.data.forEach((key, deger) {
      mesaj += "\nKey: $key Deger : $deger";
    });
    //KOLEKSİYONUN OKUNMASI
    _firestore.collection("users").getDocuments().then((querySnapshots) {
      mesaj += "\nUsers koleksiyonundaki eleman sayısı : " +
          querySnapshots.documents.length.toString();
      for (int i = 0; i < querySnapshots.documents.length; i++) {
        mesaj += "\n" + querySnapshots.documents[i].data.toString();
      }
      //ANLIK DEĞİŞİKLİKLERİN DİNLENMESİ
      DocumentReference ref =
          _firestore.collection("users").document("fatih_tutar");
      ref.snapshots().listen((degisenVeri) {
        mesaj += "\nAnlık : " + degisenVeri.data.toString();
      });
      _firestore.collection("users").snapshots().listen((snap) {
        mesaj += "\n" + snap.documents.length.toString();
      });
    });
  }

  void _veriSorgula() async {
    var dokumanlar = await _firestore
        .collection("users")
        .where("email", isEqualTo: "fatihtutar93@gmail.com")
        .getDocuments();
    for (var dokuman in dokumanlar.documents) {
      setState(() {
        mesaj += "\n\n" + dokuman.data.toString();
      });
    }
    var limitliGetir =
        await _firestore.collection("users").limit(2).getDocuments();
    for (var dokuman in limitliGetir.documents) {
      setState(() {
        mesaj += "\n\nLimitli getirilenler" + dokuman.data.toString();
      });
    }
    var diziSorgula = await _firestore
        .collection("users")
        .where("dizi", arrayContains: "narcos")
        .getDocuments();
    for (var dokuman in diziSorgula.documents) {
      setState(() {
        mesaj += "\n\nSorgudan getirilenler" + dokuman.data.toString();
      });
    }
    var stringSorgula = await _firestore
        .collection("users")
        .orderBy("email")
        .startAt(["fatih"]).endAt(['fatih' + '\uf8ff']).getDocuments();
    for (var dokuman in stringSorgula.documents) {
      setState(() {
        mesaj += "\n\nString sorgula : " + dokuman.data.toString();
      });
    }
    _firestore
        .collection("users")
        .document("fatih_tutar")
        .get()
        .then((docSnap) {
      setState(() {
        mesaj += "\n\nFatihin Verileri : " + docSnap.data.toString();
      });
      _firestore
          .collection("users")
          .orderBy('begeniSayisi')
          .startAt([
            docSnap.data['begeniSayisi']
          ]) //BUNDAN BÜYÜK OLANLARI VERİR TERSİ endAt TİR
          .getDocuments()
          .then((querySnap) {
            if (querySnap.documents.length > 0) {
              for (var bb in querySnap.documents) {
                setState(() {
                  mesaj += "\n\nFatihin beğenisinden fazla olan user : " +
                      bb.data.toString();
                });
              }
            }
          });
    });
  }

  void _galeriResimUpload() async {
    var resim = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _secilenResim = resim;
    });
    StorageReference ref =
        FirebaseStorage.instance.ref().child("user").child("fatih").child("fatih.png");
    StorageUploadTask uploadTask = await ref.putFile(_secilenResim);
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      mesaj += "\nUpload edilen resmin adresi : " + url;
    });
  }

  void _kameraResimUpload() async {
    var resim = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _secilenResim = resim;
    });
    StorageReference ref =
        FirebaseStorage.instance.ref().child("user").child("hasan").child("fatih.png");
    StorageUploadTask uploadTask = await ref.putFile(_secilenResim);
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      mesaj += "\nUpload edilen resmin adresi : " + url;
    });
  }
}
