import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  String girilenMetin = "";
  int maxLine = 1;
  FocusNode _fNode;
  TextEditingController textController1;

  String _adSoyad, _sifre, _epostaAdres;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "Varsayılan");

    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLine = 3;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    textController1.dispose();
    super.dispose();
  }

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
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("İnput İşlemleri"),
          //backgroundColor: Colors.teal.shade900,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: FloatingActionButton(
                heroTag: "birinci",
                onPressed: () {
                  FocusScope.of(context).requestFocus(_fNode);
                },
                child: Icon(Icons.edit, size: 12),
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: "ikinci",
              onPressed: () {
                textController1.text="butondan geldim";
              },
              child: Icon(Icons.edit),
              mini: true,
              backgroundColor: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: "ucuncu",
              onPressed: () {
                debugPrint(textController1.text.toString());
              },
              child: Icon(Icons.edit),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //klavyede sadece numaraların açılmasını sağlar
                textInputAction: TextInputAction.done,
                //klavyedeki onaylama tuşunun nasıl olacağına karar verir
                textAlign: TextAlign.center,
                autofocus: false,
                maxLines: maxLine,
                controller: textController1,
                maxLength: 20,
                focusNode: _fNode,
                decoration: InputDecoration(
                  hintText: "Metni buraya yazınız.",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.done),
                  suffixIcon: Icon(Icons.add),
                  fillColor: Colors.red,
                ),
                maxLengthEnforced: true,
                onChanged: (String s) => debugPrint("On Change : $s"),
                onSubmitted: (String s) {
                  debugPrint("On Submit : $s");
                  girilenMetin = s;
                },
                cursorColor: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //klavyede sadece numaraların açılmasını sağlar
                textInputAction: TextInputAction.done,
                //klavyedeki onaylama tuşunun nasıl olacağına karar verir
                textAlign: TextAlign.center,
                autofocus: false,
                maxLines: 1,
                maxLength: 100,
                controller: textController1,
                decoration: InputDecoration(
                  hintText: "Metni buraya yazınız.",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.done),
                  suffixIcon: Icon(Icons.add),
                  fillColor: Colors.red,
                ),
                maxLengthEnforced: true,
                onChanged: (String s) => debugPrint("On Change : $s"),
                onSubmitted: (String s) {
                  debugPrint("On Submit : $s");
                  girilenMetin = s;
                },
                cursorColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _girisBilgileriniOnayla(){

  }
}
