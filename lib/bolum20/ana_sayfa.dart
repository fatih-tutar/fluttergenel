import 'package:burc_rehberi/models/veri.dart';
import 'package:flutter/material.dart';

class Ana_Sayfa extends StatefulWidget {
  Ana_Sayfa(Key k) : super(key : k);
  @override
  _Ana_SayfaState createState() => _Ana_SayfaState();
}

class _Ana_SayfaState extends State<Ana_Sayfa> {
  List<Veri> tumVeriler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumVeriler=[
      Veri("Biz kimiz?","Biz kimizin içeriği buraya gelecek",false),
      Veri("Biz neredeyiz?","Biz kimizin içeriği buraya gelecek",false),
      Veri("Misyonumuz?","Biz kimizin içeriği buraya gelecek",false),
      Veri("Vizyonumuz?","Biz kimizin içeriği buraya gelecek",false),
      Veri("İletişim","Biz kimizin içeriği buraya gelecek",false),
      Veri("İletişim","Biz kimizin içeriği buraya gelecek",false),
      Veri("İletişim","Biz kimizin içeriği buraya gelecek",false),
      Veri("İletişim","Biz kimizin içeriği buraya gelecek",false),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ExpansionTile(
        key:PageStorageKey("$index"),
        title: Text(tumVeriler[index].baslik),
        initiallyExpanded: tumVeriler[index].expanded,
        children: <Widget>[
          Container(
            color: index % 2 == 0? Colors.red.shade200 : Colors.yellow.shade300,
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(tumVeriler[index].icerik),
            ),
          ),
        ],
      );
    },itemCount: tumVeriler.length,);
  }
}
