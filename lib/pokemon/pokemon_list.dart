import 'package:burc_rehberi/pokemon/pokemon_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/pokedex.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";
  Pokedex pokedex;
  Future<Pokedex> veri;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.red.shade700,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return FutureBuilder(
                future: veri,
                builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
                  if (gelenPokedex.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (gelenPokedex.connectionState ==
                      ConnectionState.done) {
//            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
//              return Text(gelenPokedex.data.pokemon[index].name);
//            });
                    return GridView.count(
                      crossAxisCount: 2,
                      children: gelenPokedex.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                      pokemon: poke,
                                    )));
                          },
                          child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 125,
                                        height: 125,
                                        child: FadeInImage.assetNetwork(
                                            placeholder: "images/loading.gif",
                                            image: poke.img,
                                            fit: BoxFit.contain),
                                      ),
                                      Text(
                                        poke.name,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                },
              );
            } else {
              return FutureBuilder(
                future: veri,
                builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
                  if (gelenPokedex.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (gelenPokedex.connectionState ==
                      ConnectionState.done) {
//            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
//              return Text(gelenPokedex.data.pokemon[index].name);
//            });
                    return GridView.extent(
                      maxCrossAxisExtent: 300,
                      children: gelenPokedex.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                      pokemon: poke,
                                    )));
                          },
                          child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: FadeInImage.assetNetwork(
                                          placeholder: "images/loading.gif",
                                          image: poke.img,
                                          fit: BoxFit.contain),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
