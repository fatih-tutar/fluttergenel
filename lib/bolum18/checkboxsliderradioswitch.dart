import 'package:flutter/material.dart';

class checkboxsliderradioswitch extends StatefulWidget {
  @override
  _checkboxsliderradioswitchState createState() =>
      _checkboxsliderradioswitchState();
}

class _checkboxsliderradioswitchState extends State<checkboxsliderradioswitch> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String secilenRenk = "Kirmizi";
  List<String> sehirler = ['Adana', 'Adıyaman', 'Afyonkarahisar', 'Ağrı', 'Amasya', 'Ankara', 'Antalya', 'Artvin',
    'Aydın', 'Balıkesir', 'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Çanakkale',
    'Çankırı', 'Çorum', 'Denizli', 'Diyarbakır', 'Edirne', 'Elazığ', 'Erzincan', 'Erzurum', 'Eskişehir',
    'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkari', 'Hatay', 'Isparta', 'İçel', 'İstanbul', 'İzmir',
    'Kars', 'Kastamonu', 'Kayseri', 'Kırklareli', 'Kırşehir', 'Kocaeli', 'Konya', 'Kütahya', 'Malatya',
    'Manisa', 'Kahramanmaraş', 'Mardin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu', 'Rize', 'Sakarya',
    'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Şanlıurfa', 'Uşak',
    'Van', 'Yozgat', 'Zonguldak', 'Aksaray', 'Bayburt', 'Karaman', 'Kırıkkale', 'Batman', 'Şırnak',
    'Bartın', 'Ardahan', 'Iğdır', 'Yalova', 'Karabük', 'Kilis', 'Osmaniye', 'Düzce'];
  String secilenSehir = "Balıkesir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: Text("Checkbox, Slider, Radio, Switch"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi;
                });
              },
              activeColor: Colors.red,
              title: Text("Checkbox title"),
              subtitle: Text("Checkbox subtitle"),
              secondary: Icon(Icons.add),
              selected: false,
            ),
            RadioListTile<String>(
              value: "Istanbul",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Secilen değer : $deger");
                });
              },
              title: Text("İstanbul"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Balikesir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Secilen değer : $deger");
                });
              },
              title: Text("Balıkesir"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Izmir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Secilen değer : $deger");
                });
              },
              title: Text("İzmir"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Anlaşma onaylandı : $deger");
                  switchState = deger;
                });
              },
              title: Text("Switch title"),
              subtitle: Text("Switch subtitle"),
              secondary: Icon(Icons.refresh),
            ),
            Text("Değeri sliderdan seçiniz"),
            Slider(
              value: sliderDeger,
              onChanged: (yeniDeger) {
                setState(() {
                  sliderDeger = yeniDeger;
                });
              },
              min: 0,
              max: 20,
              divisions: 20,
              label: sliderDeger.toString(),
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 24,
                          height: 24,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 10)),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "Kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 24,
                          height: 24,
                          color: Colors.blue,
                          margin: EdgeInsets.only(right: 10)),
                      Text("Mavi"),
                    ],
                  ),
                  value: "Mavi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 24,
                          height: 24,
                          color: Colors.green,
                          margin: EdgeInsets.only(right: 10)),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "Yesil",
                ),
              ],
              onChanged: (String secilen) {
                setState(() {
                  secilenRenk = secilen;
                });
              },
              hint: Text("Seçiniz"),
              value: secilenRenk,
            ),
            DropdownButton<String>(
              items: sehirler.map((oankiSehir) {
                return DropdownMenuItem<String>(
                  child: Text(oankiSehir),
                  value: oankiSehir,
                );
              }).toList(),
              onChanged: (s) {
                setState(() {
                  secilenSehir = s;
                });
              },
              value: secilenSehir,
            )
          ],
        ),
      ),
    );
  }
}
