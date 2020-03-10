import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/pokedex/components/pokeball_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/pokemon_tile_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use 'controller' variable to access controller
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),floatingActionButton: FloatingActionButton(onPressed: (){
      Modular.to.pushReplacementNamed('/pokedex');
    },),
      body: Observer
        (builder: (context){
      if(homeController.pokemons.error != null){
          return Center(
            child: RaisedButton(
              child: Text("Press again"),
              onPressed: (){
                homeController.fetchPokemons();
              },
            )
          );
        }

        if(homeController.pokemons.value == null){
          return PokeProgress();
        }
          var list = homeController.pokemons.value;
          return GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3),
              padding: EdgeInsets.all(12),
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              addAutomaticKeepAlives: false,
              itemBuilder: (context, index){
                return PokemonTileWidget(list[index]);
              },

          );
          },
      ),
    );
  }
}
