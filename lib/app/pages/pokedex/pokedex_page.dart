import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'file:///C:/Users/vinicius.goncalves/Coding/slidy_structure/lib/app/shared/components/appbar_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/tela_pokemon_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_controller.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_module.dart';

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
    return Scaffold(
      appBar: MyCustomAppBar(
        height: 200,
      ),
      backgroundColor: Colors.red[600],
      body: Observer(
        builder: (_){
          print(pokedexController.pokemon.value);
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TelaPokemonWidget(pokedexController.pokemon.value),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Container(
                    width: 250,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: (){
                            pokedexController.getPokemon(pokedexController.decrement());
                          },
                          color: Colors.black,
                          child: Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                        RaisedButton(
                          onPressed: (){
                            pokedexController.getPokemon(pokedexController.decrement());
                          },
                          color: Colors.black,
                          child: Icon(Icons.arrow_forward, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
