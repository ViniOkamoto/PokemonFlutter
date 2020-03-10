import 'package:flutter/material.dart';
import 'package:slidy_structure/app/pages/pokedex/components/progress_bar_animated/progress_bar_animated_widget.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';


class AbilityStatsInfo extends StatelessWidget {
  PokemonModel pokemom;
  AbilityStatsInfo(this.pokemom);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 15,
      child: Container(
        width: 320,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Abilities:'),
                Container(
                  width: 100,
                  height: 80,
                  child: ListView.builder(
                      itemCount: pokemom.abilities.length,
                      itemBuilder: (context, index){
                        return Center(
                          child: Text(pokemom.abilities[index].ability.name),
                        );
                      }
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text("Stats"),
                Container(
                    width: 100,
                    height: 80,
                    child: StatsBar(pokemom)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget StatsBar(PokemonModel pokemon){
    return Container(
        width: 90,
        height: 10,
        child: ListView.builder(
            itemCount: pokemon.stats.length,
            itemBuilder: (context, index){
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(pokemon.stats[index].stat.name, style: TextStyle(fontSize: 10),),
                    ],
                  ),
                  FAProgressBar(
                    size: 10,
                    progressColor: Colors.black,
                    borderColor: Colors.black,
                    currentValue: pokemon.stats[index].baseStat,
                    animatedDuration: const Duration(milliseconds: 300),
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.horizontal,
                  )
                ],
              );
            }
        )
    );
  }
}

