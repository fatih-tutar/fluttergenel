import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginIslemleri extends StatefulWidget {
  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();
  String mesaj = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.onAuthStateChanged.listen((user) {
      setState(() {
        if (user != null) {
          mesaj += "\nListener tetiklendi. Kullanıcı oturum açtı.";
        } else {
          mesaj += "\nListener tetiklendi. Kullanıcı oturumu kapattı.";
        }
      });
    });
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
                  child: Text(
                    "Üye Ol", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () => Navigator.pushNamed(context, "/uyeol"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  child: Text(
                    "Giriş", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () => Navigator.pushNamed(context, "/giris"),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _emailveSifreileUserOlustur,
              child: Text("Email / Şifre Yeni Kullanıcı Oluştur"),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: _emailveSifreileGirisYap,
              child: Text("Email / Şifre Giriş Yap"),
              color: Colors.yellow,
            ),
            RaisedButton(
              onPressed: _cikisYap,
              child: Text("Çıkış Yap"),
              color: Colors.purple,
            ),
            RaisedButton(
              onPressed: _sifremiUnuttum,
              child: Text("Şifremi unuttum"),
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: _sifremiGuncelle,
              child: Text("Şifremi güncelle"),
              color: Colors.orange,
            ),
            RaisedButton(
              onPressed: _emailGuncelle,
              child: Text("E-posta güncelle"),
              color: Colors.green,
            ),
            RaisedButton(
              onPressed: _googleGirisi,
              child: Text("Google ile Giriş"),
              color: Colors.brown,
            ),
            RaisedButton(
              onPressed: _telNoGiris,
              child: Text("Tel No ile Giriş"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: _mesajTemizle,
              child: Text("Mesajları temizle"),
              color: Colors.pink,
            ),
            Text(mesaj),
          ],
        ),
      ),
    );
  }

  void _emailveSifreileUserOlustur() async {
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
        mesaj += "Uid : ${firebaseUser.user.uid} "
            "\nMail : ${firebaseUser.user.email} "
            "\nMain Onayı : ${firebaseUser.user.isEmailVerified}"
            "\n Email gönderildi lütfen onaylayın.";
      });
    } else {
      setState(() {
        mesaj += "\nBu e-posta zaten kullanımda.";
      });
    }
  }

  void _emailveSifreileGirisYap() {
    String mail = "fatihtutar93@gmail.com";
    String sifre = "123456";
    _auth
        .signInWithEmailAndPassword(email: mail, password: sifre)
        .then((oturumAcmisKullanici) {
      if (oturumAcmisKullanici.user.isEmailVerified) {
        mesaj += "\nYönlendiriliyorsunuz...";
      } else {
        mesaj += "\nAktive edilmemiş hesap!";
        _auth.signOut();
      }
      setState(() {});
    }).catchError((hata) {
      setState(() {
        mesaj += "\nE-posta veya şifreniz hatalıdır.";
      });
    });
  }

  void _cikisYap() async {
    if (await _auth.currentUser() != null) {
      _auth.signOut().then((data) {
        _googleAuth.signOut();
        mesaj += "\nKullanıcı çıkış yaptı";
      }).catchError((hata) {
        mesaj += "\nÇıkış yapılamadı. Hata sebebi : $hata";
      });
    } else {
      mesaj += "\nOturum açmış bir kullanıcı yok";
    }
    setState(() {});
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

  void _sifremiGuncelle() async {
    _auth.currentUser().then((user) {
      if (user != null) {
        user.updatePassword("123456").then((a) {
          setState(() {
            mesaj += "\nŞifre güncellendi";
          });
        }).catchError((hata) {
          setState(() {
            mesaj += "\nŞifre güncellenirken hata oluştu.";
          });
        });
      } else {
        setState(() {
          mesaj += "\nŞifre güncellemek için önce oturum açın.";
        });
      }
    }).catchError((hata) {
      setState(() {
        mesaj += "\nKullanıcı getirilirken çıkan hata.";
      });
    });
  }

  void _emailGuncelle() {
    _auth.currentUser().then((user) {
      if (user != null) {
        user.updateEmail("fatihtutar93@gmail.com").then((a) {
          setState(() {
            mesaj += "\nE-posta güncellendi";
          });
        }).catchError((hata) {
          setState(() {
            mesaj += "\nE-posta güncellenirken hata oluştu.";
          });
        });
      } else {
        setState(() {
          mesaj += "\nE-posta güncellemek için önce oturum açın.";
        });
      }
    }).catchError((hata) {
      setState(() {
        mesaj += "\nKullanıcı getirilirken çıkan hata.";
      });
    });
  }

  void _googleGirisi() {
    _googleAuth.signIn().then((sonuc) {
      sonuc.authentication.then((googleKeys) {
        AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: googleKeys.idToken, accessToken: googleKeys.accessToken);
        _auth.signInWithCredential(credential).then((user) {
          setState(() {
            mesaj += "\nGmail ile giriş yapıldı.";
          });
        }).catchError((hata) {
          setState(() {
            mesaj += "\nFirebase ve google kullanıcı hatası $hata";
          });
        });
      }).catchError((hata) {
        setState(() {
          mesaj += "\nGoogle authentication hatası $hata";
        });
      });
    }).catchError((hata) {
      setState(() {
        mesaj += "\nGoogle Auth signin hatası $hata";
      });
    });
  }

  void _mesajTemizle() {
    setState(() {
      mesaj = "";
    });
  }

  void _telNoGiris() {
    _auth.verifyPhoneNumber(phoneNumber: "+905315426368",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential user){
          debugPrint("Verification tamamlandı user : $user");
        },
        verificationFailed: (AuthException exception){
          debugPrint("Authexception ${exception.message}");
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          debugPrint("Verification id : $verificationId");
          debugPrint("Forceresending token id : $forceResendingToken");
        },
        codeAutoRetrievalTimeout: (String verificationID){
          debugPrint("Time out : verification id : $verificationID");
        });
  }
}
