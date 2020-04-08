import 'package:burc_rehberi/bolum26/profilsayfasi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();
  String mesaj = "";
  var formKey = GlobalKey<FormState>();
  String kullaniciEposta, kullaniciSifre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Oturum İşlemleri"), actions: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/uyeol"),
                child: Text(
                  "Üye Ol",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.00),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/giris"),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ]),
      body: Column(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (text) {
                      kullaniciEposta = text;
                    },
                    decoration: InputDecoration(
                      hintText: "E-posta adresinizi giriniz.",
                      labelText: "E-posta",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    onSaved: (text) {
                      kullaniciSifre = text;
                    },
                    decoration: InputDecoration(
                      hintText: "Parola giriniz.",
                      labelText: "Parola",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: giris,
                  child: Text("Giriş", style: TextStyle(color: Colors.black)),
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: _sifremiUnuttum,
                    child: Text("Şifremi unuttum."),
                  ),
                ),
                RaisedButton(
                  onPressed: _googleGirisi,
                  child: Text("Google ile Giriş",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                ),
              ],
            ),
          ),
          hatamesaji(),
        ],
      ),
    );
  }

  void _googleGirisi() {
    _googleAuth.signIn().then((sonuc){

      sonuc.authentication.then((googleKeys){

        AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleKeys.idToken, accessToken: googleKeys.accessToken);
        _auth.signInWithCredential(credential).then((user){

          setState(() {
            mesaj = "Gmail ile giriş yapıldı.";
            Navigator.pushNamed(context, "/profilsayfasi");
          });

        }).catchError((hata){
          setState(() {
            mesaj += "\nFirebase ve google kullanıcı hatası $hata";
          });
        });

      }).catchError((hata){
        setState(() {
          mesaj += "\nGoogle authentication hatası $hata";
        });
      });

    }).catchError((hata){
      setState(() {
        mesaj += "\nGoogle Auth signin hatası $hata";
      });
    });
  }

  void giris() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      String mail = "fatihtutar93@gmail.com";
      String sifre = "123456";
      _auth.signInWithEmailAndPassword(email: mail, password: sifre).then((oturumAcmisKullanici) {
        if (oturumAcmisKullanici.user.isEmailVerified) {
          mesaj = "girdi";
          Navigator.pushNamed(context, "/profilsayfasi");
        } else {
          mesaj = "Aktive edilmemiş hesap!";
          _auth.signOut();
        }
        setState(() {});
      }).catchError((hata) {
        setState(() {
          mesaj = "E-posta veya şifreniz hatalıdır.";
        });
      });
    }
  }

  hatamesaji() {
    if(mesaj != ""){
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.orange,
        ),
        child: Text(mesaj, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      );
    }else{
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Text(mesaj, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      );
    }
  }

  void _profilSayfasinaGit(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfilSayfasi()));
  }

  void _sifremiUnuttum() {
    String mail = "fatihtutar93@gmail.com";
    _auth.sendPasswordResetEmail(email: mail).then((v) {
      setState(() {
        mesaj += "\nŞifre güncellemeniz için e-posta gönderildi.";
      });
    }).catchError((hata) {
      setState(() {
        mesaj += "\nGirdiğiniz e-posta hatalı. Hata : $hata";
      });
    });
  }
}
