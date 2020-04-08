import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String mesaj = "", kullaniciEposta, kullaniciSifre;
  var mailFormKey = GlobalKey<FormState>();
  var sifreFormKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login İşlemleri"),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  child: Text("Çıkış", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: _cikisYap,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Form(
              key: mailFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (text) {
                      kullaniciEposta = text;
                    },
                    decoration: InputDecoration(
                      hintText: "E-posta adresinizi giriniz.",
                      labelText: "E-posta",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "E-posta Güncelle",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: _emailGuncelle,
                  ),
                ],
              ),
            ),
            Form(
              key: sifreFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (text) {
                      kullaniciSifre = text;
                    },
                    decoration: InputDecoration(
                      hintText: "Yeni parolanızı giriniz",
                      labelText: "Parola",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "Şifremi Güncelle",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.orange,
                    onPressed: _sifremiGuncelle,
                  ),
                  Text(mesaj),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _cikisYap() async {
    if (await _auth.currentUser() != null) {
      _auth.signOut().then((data) {
        mesaj = "Kullanıcı çıkış yaptı";
      }).catchError((hata) {
        mesaj = "Çıkış yapılamadı. Hata sebebi : $hata";
      });
    } else {
      mesaj = "Oturum açmış bir kullanıcı yok";
    }
    setState(() {});
  }

  void _sifremiGuncelle() async {
    if (sifreFormKey.currentState.validate()) {
      sifreFormKey.currentState.save();
      String degisensifre = kullaniciSifre;
      _auth.currentUser().then((user) {
        if (user != null) {
          user.updatePassword(degisensifre).then((a) {
            setState(() {
              mesaj = "Şifre güncellendi";
            });
          }).catchError((hata) {
            setState(() {
              mesaj = "Şifre güncellenirken hata oluştu.";
            });
          });
        } else {
          setState(() {
            mesaj = "Şifre güncellemek için önce oturum açın.";
          });
        }
      }).catchError((hata) {
        setState(() {
          mesaj = "Kullanıcı getirilirken çıkan hata.";
        });
      });
    }
  }

  void _emailGuncelle() {
    if (mailFormKey.currentState.validate()) {
      mailFormKey.currentState.save();
      String degismail = kullaniciEposta;
      _auth.currentUser().then((user) {
        if (user != null) {
          user.updateEmail(degismail).then((a) {
            setState(() {
              mesaj = "E-posta güncellendi";
            });
          }).catchError((hata) {
            setState(() {
              mesaj = "E-posta güncellenirken hata oluştu.";
            });
          });
        } else {
          setState(() {
            mesaj = "E-posta güncellemek için önce oturum açın.";
          });
        }
      }).catchError((hata) {
        setState(() {
          mesaj = "Kullanıcı getirilirken çıkan hata.";
        });
      });
    }
  }
}
