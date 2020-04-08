import 'package:flutter/material.dart';

class formverikontrolvekayit extends StatefulWidget {
  @override
  _formverikontrolvekayitState createState() => _formverikontrolvekayitState();
}

class _formverikontrolvekayitState extends State<formverikontrolvekayit> {
  TextEditingController textController1;
  String _adSoyad, _sifre, _epostaAdres;
  bool otomatikKontrol = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Theme(
      //data: ThemeData(
      //primaryColor: Colors.indigo,
      //accentColor: Colors.red, Bu bir kullanım bir de önceki ayarları al bazılarını değiştir dersek
      //),
      data: Theme.of(context).copyWith(
        accentColor: Colors.black,
        primaryColorDark: Colors.red,
        errorColor: Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Formlarda Veri Kontrolü ve Kayıt"),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            autovalidate: otomatikKontrol,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınız ve Soyadınız",
                    labelText: "Ad Soyad",
                    border: OutlineInputBorder(),
                  ),
                  //initialValue: "İlk değer",
                  validator: _ismiKontrol,
                  onSaved: (deger) => _adSoyad = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "E-posta Adresi",
                      labelText: "E-posta",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2))),
                  validator: _emailKontrol,
                  onSaved: (deger) => _epostaAdres = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Şifrenizi yazınız.",
                      labelText: "Şifre",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2))),
                  validator: (String girilenVeri){
                    if(girilenVeri.length < 6){
                      return "En az 6 karakter gerekli";
                    }else{
                      return null;
                    }
                  },
                  onSaved: (deger) => _sifre = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                /*RaisedButton(
                  onPressed: _girisBilgileriniOnayla,
                  disabledColor: Colors.amber,
                  color: Colors.blueAccent,
                  child: Text("Kaydet"),
                ),
                SizedBox(
                  height: 10,
                ),*/
                RaisedButton.icon(
                  onPressed: _girisBilgileriniOnayla,
                  icon: Icon(Icons.save),
                  disabledColor: Colors.amber,
                  color: Colors.blueAccent,
                  label: Text("Kaydet"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _girisBilgileriniOnayla() {

    if (formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("Ad Soyad : $_adSoyad, E-posta : $_epostaAdres Şifre : $_sifre");
    }else{
      setState((){
        otomatikKontrol = true;
      });
    }

  }

  String _emailKontrol(String eposta) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(eposta))
      return "Geçersiz e-posta";
    else
      return null;
  }

  String _ismiKontrol(String isim){
    RegExp regex = RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(isim))
      return "İsim numara içermemeli";
    else
      return null;
  }
}
