import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/notsepeti"),
                    leading: Image.asset(
                      "images/notapplogo.jpeg",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Not Sepeti"),
                    subtitle: Text("Notlarınızı kaydetmenizi sağlar."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/pokemonlist"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/pokemon_logo.png"),
                      radius: 30,
                    ),
                    title: Text("Pokedex"),
                    subtitle: Text("Pokemon bilgilerini internetten json ile çektiğimiz uygulama."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/moda"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/modalogo.jpg"),
                      radius: 30,
                    ),
                    title: Text("Moda Uygulaması"),
                    subtitle: Text("Hazır bir tasarımı fluttera gömdüğümüz bir uygulama"),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/devirIskat"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/deviriskatlogo.jpg"),
                      radius: 30,
                    ),
                    title: Text("Devir İskat Uygulaması"),
                    subtitle: Text("Devir iskat hesabınızı yapmanızı sağlar."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/notOrtalamasi"),
                    leading: Image.asset(
                      "images/notortalamalogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Not Ortalaması Uygulaması"),
                    subtitle: Text("Not ortalamanızı bulmanızı sağlar."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/burcListesi"),
                    leading: Image.asset(
                      "images/burcrehberilogo.jpg",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Burç Uygulaması"),
                    subtitle:
                        Text("Burçların özellikleri hakkında bilgi verir."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/bolum26"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Bölüm 26"),
                    subtitle: Text("Firebase Authentication İşlemleri"),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/bolum24"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Bölüm 24"),
                    subtitle: Text("Json ve API kullanımı örneklerini gösterir."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/bolum22"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/jsonlogo.png"),
                      radius: 30,
                    ),
                    title: Text("Bölüm 22"),
                    subtitle: Text("Json ve API kullanımı örneklerini gösterir."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/bolum20"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Bölüm 20"),
                    subtitle: Text("20. Bölümdeki örnekleri içerir."),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, "/bolum18"),
                    leading: Image.asset(
                      "images/flutterlogo.png",
                      width: 70,
                      height: 70,
                    ),
                    title: Text("Bölüm 18"),
                    subtitle: Text("18. Bölümdeki örnekleri içerir."),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
