import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/gonderi.dart';

class RemoteApi extends StatefulWidget {
  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {

  Future<List<Gonderi>> _gonderiGetir() async{
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == 200){//http hataları 404 500 gibi
      //return Gonderi.fromJsonMap(json.decode(response.body));
      return (json.decode(response.body) as List).map((tekGonderiMap) => Gonderi.fromJsonMap(tekGonderiMap)).toList();
    }else{
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*_gonderiGetir().then((okunanGonderi){
      gonderi = okunanGonderi;
      debugPrint("Gelen değer : "+ gonderi.title);
    });*/ //BU KISMI CONSOLEDA GÖRMEK İÇİN YAPTIK GEREK YOK ASLINDA
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote API Kullanımı"),
      ),
      body: FutureBuilder(future: _gonderiGetir(), builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context,index){
            return ListTile(
              title: Text(snapshot.data[index].title),
              subtitle: Text(snapshot.data[index].body),
              leading: CircleAvatar(child: Text(snapshot.data[index].id.toString()),),
            );
          });
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
