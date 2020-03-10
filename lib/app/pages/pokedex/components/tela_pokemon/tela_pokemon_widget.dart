import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'file:///C:/Users/vinicius.goncalves/Coding/slidy_structure/lib/app/shared/components/appbar_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/progress_bar_animated/progress_bar_animated_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/abilities_stats_info_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/tela_pokemon_info_widget.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';

class TelaPokemonWidget extends StatelessWidget {
  PokemonModel pokemon;
  TelaPokemonWidget(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Container(
          width: 380,
          height: 380,
          decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.all(Radius.circular(8.0),
            ),
          ),
        ),
        Positioned(
          left: 138,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: CircleButton(
                  color: Color(0xffCD3C3B),
                  size: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: CircleButton(
                  color: Color(0xffCD3C3B),
                  size: 10,
                ),
              )
            ],
          ),
        ),
        TelaInfoWidget(pokemon),
       AbilityStatsInfo(pokemon),
      ],
    );
  }
}
