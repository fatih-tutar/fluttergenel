import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UyeOl extends StatefulWidget {
  @override
  _UyeOlState createState() => _UyeOlState();
}

class _UyeOlState extends State<UyeOl> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
      body: Center(
        child: Column(
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
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _uyeOl,
                        child: Text("Üye Ol"),
                        color: Colors.redAccent,
                      ),
                    ],
                  )
                ],
              ),
            ),
            hatamesaji(),
          ],
        ),
      ),
    );
  }

  void _uyeOl() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      String mail = "fatihtutar93@gmail.com";
      String sifre = "123456";
      var firebaseUser = await _auth
          .createUserWithEmailAndPassword(email: mail, password: sifre)
          .catchError((e) => debugPrint("Hata:" + e.toString()));

      if (firebaseUser != null) {
        firebaseUser.user.sendEmailVerification().then((data) {
          _auth.signOut();
        }).catchError((e) => debugPrint("Mail gönderirken hata : $e"));
        setState(() {
          mesaj = "Gönderdiğimiz e-postadaki onay bağlantısına tıklayarak hesabınızı onaylı hale getiriniz.";
        });
      } else {
        setState(() {
          mesaj = "Bu e-posta zaten kullanımda.";
        });
      }
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
}
