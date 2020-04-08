import 'package:flutter/material.dart';

class bolum18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 18"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/textFieldIslemleri"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("92 - 93 - 94 - 95"),
                    subtitle: Text("Inputlar, Textfieldlar, Controllerlar, Temalar ve Kişiselleştirme"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/formverikontrolvekayit"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("96"),
                    subtitle: Text("Form verilerinin kontrolü ve kaydedilmesi"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/checkboxsliderradioswitch"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("97 - 98"),
                    subtitle: Text("Checkbox, Slider, Radio, Switch Widget ve DropdownMenu Kullanımı"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/TarihSaatOrnek"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("99"),
                    subtitle: Text("Tarih ve Saat Seçme İşlemleri"),
                  ),
                ),
              ),
            ),
            Container(
              child:  Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/Stepper_Kullanimi"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("100 - 101"),
                    subtitle: Text("Stepper Kullanımı"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
