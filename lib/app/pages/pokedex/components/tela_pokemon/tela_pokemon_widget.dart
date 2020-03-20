import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/abilities_stats_info_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/components/tela_pokemon/tela_pokemon_info_widget.dart';
import 'package:slidy_structure/app/shared/components/appbar_widget.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';

class TelaPokemonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
          width: MediaQuery.of(context).size.width*0.95,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.all(Radius.circular(8.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: TelaInfoWidget(),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: AbilityStatsInfo(),
              )
            ],
          )
    );
  }
}
