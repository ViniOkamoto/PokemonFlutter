import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/tela_pokemon_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_controller.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_module.dart';
import 'package:slidy_structure/app/shared/components/appbar_widget.dart';

class PokedexPage extends StatefulWidget {
  final String title;
  final String index;
  const PokedexPage({Key key, this.title = "Pokedex", this.index}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  AnimationController animationController;
  final pokedexController = Modular.get<PokedexController>();
  @override
  Widget build(BuildContext context) {
    widget.index == null ? pokedexController.pokeIndex = "1" : pokedexController.pokeIndex = widget.index;
    pokedexController.indexUrl = int.parse(pokedexController.pokeIndex);
    pokedexController.pokeId = pokedexController.indexUrl;
    pokedexController.getPokemon();
    return Scaffold(
      appBar: MyCustomAppBar(
        height: 120,
      ),
      backgroundColor: Colors.red[600],
      body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TelaPokemonWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4,bottom: 15),
                  child: Container(
                    width: 250,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: pokedexController.decrement,
                          color: Colors.black,
                          child: Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                        RaisedButton(
                          onPressed: pokedexController.increment,
                          color: Colors.black,
                          child: Icon(Icons.arrow_forward, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
  }
}
