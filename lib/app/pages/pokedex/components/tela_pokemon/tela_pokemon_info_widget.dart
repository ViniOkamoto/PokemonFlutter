import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'file:///C:/Users/Vinicius%20Okamoto/Coding/PokemonSlidy/lib/app/shared/components/pokeball_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_controller.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/utils/constants.dart';

class TelaInfoWidget extends StatelessWidget {
  final _pokemon = Modular.get<PokedexController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff404B5C),
          borderRadius: BorderRadius.all(Radius.circular(5.0),
          ),
        ),
        child: Observer(
          builder: (_){
            if(_pokemon.pokemon.value == null){
              return PokeProgress();
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _ColunaPokemon(_pokemon.pokemon.value),
                _ColunaInfoType(context,_pokemon.pokemon.value),
              ],
            );
          },
        )
      ),
    );
  }
  Widget _ColunaInfoType(context, PokemonModel pokemon){
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            width: MediaQuery.of(context).size.width* 0.3,
            height: MediaQuery.of(context).size.height* 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: <Widget>[
                Text("TYPE:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                Container(
                  width: 110,
                  height: 90,
                  child:  ListView.builder(
                      itemCount: pokemon.types.length,
                      itemBuilder: (context, index){
                        final type = pokemon.types[index].type;
                        return Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              decoration: BoxDecoration(
                                color: catchColor(type.name),
                                borderRadius: BorderRadius.all(Radius.circular(8.0)
                                ),
                              ),
                              child: Center(
                                child: Text(type.name.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text("HEIGHT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                Text(pokemon.height.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("WEIGHT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                Text(pokemon.height.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ],
            )
        )
    );
  }

  Widget _ColunaPokemon(PokemonModel pokemon){
              return Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                     Container(
                       width: 200,
                       child:  Center(
                         child: Text(pokemon.name.toUpperCase(), style: TextStyle(
                             color: Colors.white,
                             fontSize: 25,
                             fontWeight: FontWeight.w700),),
                       ),
                       ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Image.network(
                          pokemon.sprites.frontDefault, fit: BoxFit.fill,),
                      ),
                      Container(
                        width: 65,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)
                          ),
                        ),
                        child: Center(
                          child: Text("#" + pokemon.id.toString().padLeft(3, '0'),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  )
              );
  }
}
