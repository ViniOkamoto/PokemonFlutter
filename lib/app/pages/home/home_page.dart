import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Container(
          height: 50,
          child: Image.asset("assets/images/pokedex_logo.png"),
        )
      ),
      body: Observer(builder: (context){
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
          return Center(child: CircularProgressIndicator());
        }
          var list = homeController.pokemons.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index){
              print(list[index]);
              return ListTile(
                title: Text(list[index].name),

              );
            },
          );
          },
      ),
    );
  }
}
