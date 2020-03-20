import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/components/pokemon_tile_widget.dart';
import 'package:slidy_structure/app/shared/components/appbar_widget.dart';
import 'package:slidy_structure/app/shared/components/pokeball_widget.dart';
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
      appBar: MyCustomAppBar(
        height: 120
      ),
      backgroundColor: Colors.red[600],
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
          return ListView.builder(
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
