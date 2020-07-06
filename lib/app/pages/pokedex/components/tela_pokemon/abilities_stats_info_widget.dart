import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/pokedex/components/progress_bar_animated/progress_bar_animated_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_controller.dart';
import 'package:slidy_structure/app/shared/components/pokeball_widget.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/utils/constants.dart';


class AbilityStatsInfo extends StatelessWidget {
  final _pokemon = Modular.get<PokedexController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:(_){
        final pokemon = _pokemon.pokemon.value;
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('ABILITIES:', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Observer(
                    builder: (_){
                      if(_pokemon.pokemon.value == null){
                        return PokeProgress(width: 70, height: 70,);
                      }
                      return Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: ListView.builder(
                            itemCount: pokemon.abilities.length,
                            itemBuilder: (context, index){
                              return Center(
                                child: Text(pokemon.abilities[index].ability.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
                              );
                            }
                        ),
                      );
                    },
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("STATS:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Observer(
                    builder: (_){
                      if(_pokemon.pokemon.value == null){
                        return PokeProgress(height: 70, width: 70,);
                      }
                      return Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: statsBar(pokemon)
                      );
                    },
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
  Widget statsBar(PokemonModel pokemon){
    return Container(
        width: 90,
        height: 10,
        child:Scrollbar(
          child: ListView.builder(
              itemCount: pokemon.stats.length,
              itemBuilder: (context, index){
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Row(
                        children: <Widget>[
                          Text(pokemon.stats[index].stat.name.toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200)),
                        ],
                      ),
                    ),
                    FAProgressBar(
                      size: 15,
                      progressColor: catchColor(pokemon.stats[index].stat.name),
                      borderColor: catchColor(pokemon.stats[index].stat.name),
                      currentValue: pokemon.stats[index].baseStat,
                      animatedDuration: const Duration(milliseconds: 300),
                      verticalDirection: VerticalDirection.up,
                      direction: Axis.horizontal,
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}

