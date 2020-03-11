import 'package:mobx/mobx.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

part 'pokedex_controller.g.dart';

class PokedexController = _PokedexControllerBase with _$PokedexController;

abstract class _PokedexControllerBase with Store {
 final PokeRepository repository;


 @observable
 ObservableFuture<List<PokemonModel>> pokemons;
 ObservableFuture<PokemonModel> pokemon;
 String pokeIndex;

 _PokedexControllerBase(this.repository) {
  getPokemon("20");
 }


 @action
 String increment() {
  int a = int.parse(pokeIndex);
  a++;
  return pokeIndex = a.toString();
 }
 String decrement() {
  int a = int.parse(pokeIndex);
  if(a > 1){
   a++;
   return pokeIndex = a.toString();
  }
   return null;
 }

 getPokemon(String pokeIndex){
  pokemon = repository.getPokemon(pokeIndex).asObservable();
 }

}
