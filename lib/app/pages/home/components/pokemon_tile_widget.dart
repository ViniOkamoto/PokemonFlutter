import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';

class PokemonTileWidget extends StatelessWidget {
  final PokemonModel pokemonModel;
  PokemonTileWidget(this.pokemonModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: (){
            Modular.to.pushReplacementNamed('/pokedex/${pokemonModel.id}');},
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.only(topLeft:Radius.circular(10), bottomLeft:Radius.circular(10)),
            ),

                child: Row(
                    children: <Widget>[
                      Spacer(),
                      Text("${pokemonModel.name}".toUpperCase(), style: TextStyle(
                        fontSize: 30
                      )),
                      Spacer(flex: 4,),
                      Container(
                        width: 25,
                        height: 25,
                        padding: EdgeInsets.only(left: 5),
                        child:  Image.asset("assets/images/Pokebola.png"),
                      ),
                      Text("#" + pokemonModel.id.toString().padLeft(3, '0'), style: TextStyle(
                        fontSize: 30,
                      )),

                    ],
                  ),
                )
          ),
    );
  }
}
