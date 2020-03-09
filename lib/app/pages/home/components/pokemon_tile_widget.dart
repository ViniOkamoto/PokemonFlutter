import 'package:flutter/material.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';

class PokemonTileWidget extends StatelessWidget {
  final PokemonModel pokemonModel;
  PokemonTileWidget(this.pokemonModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.network("${pokemonModel.sprites.frontDefault}", height: 90,),

              Text("${pokemonModel.name}"),

            ],
          ),
        ),
      ),
    );
  }
}
