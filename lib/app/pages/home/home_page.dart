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
      if(homeController.pokemons.length == 0 && homeController.pokemons != null){
        return PokeProgress(height: 70, width: 70,);
      }
        if(homeController.pokemons == null){

        }
          var list = homeController.pokemons;
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Center(
                  child: PokeBackground(
                    width: 400,
                    height: 400,
                    opacity: 0.4,
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.all(12),
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length + 1,
                  addAutomaticKeepAlives: false,
                  itemBuilder: (context, index){
                    if(index < list.length){
                    return PokemonTileWidget(list[index]);
                    } else if(index > 1){
                      homeController.fetchPokemons();
                      return PokeProgress(width: 50, height: 50,);
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          );
          },
      ),
    );
  }
}
