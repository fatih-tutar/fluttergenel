import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detay.dart';

class ModaApp extends StatefulWidget{
  @override
  _ModaAppState createState() => _ModaAppState();
}

class _ModaAppState extends State<ModaApp> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync:this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(indicatorColor: Colors.transparent, controller: tabController, tabs: [
          Tab(icon: Icon(Icons.more,color: Colors.grey,size: 22,),),
          Tab(icon: Icon(Icons.play_arrow,color: Colors.grey,size: 22,),),
          Tab(icon: Icon(Icons.navigation,color: Colors.grey,size: 22,),),
          Tab(icon: Icon(Icons.supervised_user_circle,color: Colors.grey,size: 22,),),
        ],),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Moda Uygulaması",
          style: TextStyle(
              fontFamily: 'ModaFontu',
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
            color: Colors.grey,
          ),
          /*IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
            color: Colors.yellow.shade900,
          )*/
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Container(
            height: 140,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                listeElemani('images/model1.jpeg', 'images/modalogo.jpg'),
                SizedBox(
                  width: 30,
                ),
                listeElemani('images/model2.jpeg', 'images/louisvuitton.jpg'),
                SizedBox(
                  width: 30,
                ),
                listeElemani('images/model3.jpeg', 'images/chloelogo.png'),
                SizedBox(
                  width: 30,
                ),
                listeElemani('images/model1.jpeg', 'images/modalogo.jpg'),
                SizedBox(
                  width: 30,
                ),
                listeElemani('images/model2.jpeg', 'images/louisvuitton.jpg'),
                SizedBox(
                  width: 30,
                ),
                listeElemani('images/model3.jpeg', 'images/chloelogo.png'),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              //color: Colors.blue.shade300,
              child: Container(
                height: 550,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('images/model1.jpeg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daisy",
                                style: TextStyle(
                                    fontFamily: 'modaFontu',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "34 mins ago",
                                style: TextStyle(
                                    fontFamily: 'modaFontu',
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 22,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "This official website features a ribbed knit zipper jacket that"
                        "modern and stylish. İt looks very temparatue and is recommend to friends.",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'modaFontu',
                            color: Colors.grey)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detay(imgPath:'images/modelgrid1.jpeg')));
                          },
                          child: Hero(
                            tag: 'images/modelgrid1.jpeg',
                            child: Container(
                              height: 200,
                              width: (MediaQuery.of(context).size.width - 50) / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage('images/modelgrid1.jpeg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detay(imgPath:'images/modelgrid2.jpeg')));
                              },
                              child: Hero(
                                tag: 'images/modelgrid2.jpeg',
                                child: Container(
                                  height: 95,
                                  width:
                                      (MediaQuery.of(context).size.width - 100) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage('images/modelgrid2.jpeg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detay(imgPath:'images/modelgrid3.jpeg')));
                              },
                              child: Hero(
                                tag: 'images/modelgrid3.jpeg',
                                child: Container(
                                  height: 95,
                                  width:
                                      (MediaQuery.of(context).size.width - 100) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage('images/modelgrid3.jpeg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              "# Louis Vuitton",
                              style: TextStyle(
                                fontFamily: 'modaFontu',
                                fontSize: 10,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              "# Chloe",
                              style: TextStyle(
                                fontFamily: 'modaFontu',
                                fontSize: 10,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.reply,
                          color: Colors.grey.withOpacity(0.4),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1.7k",
                          style: TextStyle(
                              fontFamily: 'modaFontu',
                              fontSize: 16,
                              color: Colors.grey.withOpacity(0.6)),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.comment,
                          color: Colors.grey.withOpacity(0.4),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "325",
                          style: TextStyle(
                              fontFamily: 'modaFontu',
                              fontSize: 16,
                              color: Colors.grey.withOpacity(0.6)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width-235,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "2.3k",
                                style: TextStyle(
                                    fontFamily: 'modaFontu',
                                    fontSize: 16,
                                    color: Colors.grey.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listeElemani(String imagePath, String logoPath) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown.shade300,
          ),
          child: Center(
              child: Text(
            "Follow",
            style: TextStyle(
                fontFamily: 'ModaFontu', fontSize: 11, color: Colors.white),
          )),
        ),
      ],
    );
  }
}
