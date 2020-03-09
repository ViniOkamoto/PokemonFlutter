import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/components/appbar_widget.dart';
import 'package:slidy_structure/app/pages/home/components/Paint_widget.dart';
import 'package:slidy_structure/app/pages/home/components/pokeball_widget.dart';
import 'package:slidy_structure/app/pages/home/components/pokemon_tile_widget.dart';
import 'package:slidy_structure/app/pages/home/components/tela_pokemon/tela_pokemon_widget.dart';
import 'package:slidy_structure/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnimationController animationController;

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        height: 200,
      ),
      backgroundColor: Colors.red[600],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               TelaPokemonWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white
              ),
            )

          ],
        ),
      ),
//      Observer(builder: (context){
//        if(homeController.pokemons.error != null){
//          return Center(
//            child: RaisedButton(
//              child: Text("Press again"),
//              onPressed: (){
//                homeController.fetchPokemons();
//              },
//            )
//          );
//        }
//
//        if(homeController.pokemons.value == null){
//          return PokeProgress();
//        }
//          var list = homeController.pokemons.value;
//          return GridView.builder(
//              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3),
//              padding: EdgeInsets.all(12),
//              physics: BouncingScrollPhysics(),
//              itemCount: list.length,
//              addAutomaticKeepAlives: false,
//              itemBuilder: (context, index){
//                return PokemonTileWidget(list[index]);
//              },
//
//          );
//          },
//      ),
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
