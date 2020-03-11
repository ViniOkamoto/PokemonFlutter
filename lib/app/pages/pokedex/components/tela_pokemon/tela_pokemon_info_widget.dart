import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/utils/constants.dart';

class TelaInfoWidget extends StatelessWidget {
  PokemonModel _pokemon;
  TelaInfoWidget(this._pokemon);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 30,
      child: Container(
        width: 320,
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xff404B5C),
          borderRadius: BorderRadius.all(Radius.circular(5.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _ColunaPokemon(_pokemon),
            _ColunaInfoType(_pokemon.types),
          ],
        ),
      ),
    );
  }
  Widget _ColunaInfoType(List<Types> type){
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: <Widget>[
                Text("TYPE:"),
                Container(
                  width: 100,
                  height: 100,
                  child:  ListView.builder(
                      itemCount: type.length,
                      itemBuilder: (context, index){
                        print(type);
                        return Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Center(
                            child: Container(
                              width: 90,
                              height: 15,
                              decoration: BoxDecoration(
                                color: catchColor(type[index].type.name),
                                borderRadius: BorderRadius.all(Radius.circular(8.0)
                                ),
                              ),
                              child: Center(
                                child: Text(type[index].type.name.toUpperCase(), style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("HEIGHT"),
                Text(_pokemon.height.toString()),
                SizedBox(
                  height: 10,
                ),
                Text("WEIGHT"),
                Text(_pokemon.weight.toString()),
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
            Text(pokemon.name.toUpperCase() , style: TextStyle(color: Colors.white, fontSize: 25),),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Image.network(pokemon.sprites.frontDefault),
            ),
            Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(50.0)
                ),
              ),
              child: Center(
                child: Text(pokemon.id.toString().padLeft(3,'0')),
              ),
            ),
          ],
        )
    );
  }
}
