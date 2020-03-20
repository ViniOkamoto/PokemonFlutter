import 'package:mobx/mobx.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

part 'pokedex_controller.g.dart';

class PokedexController = _PokedexControllerBase with _$PokedexController;

abstract class _PokedexControllerBase with Store {
 final PokeRepository repository;
 _PokedexControllerBase(this.repository);

 @observable
 ObservableFuture<List<PokemonModel>> pokemons;
 @observable
 ObservableFuture<PokemonModel> pokemon;
 @observable
 String pokeIndex;

 @action
  increment() {
  int b = int.parse(pokeIndex);
  if(b == 802) {
   b = 1;
  } else{
  b++;
  }
  pokeIndex = b.toString();
  getPokemon();

 }
 @action
  decrement() {
  int a = int.parse(pokeIndex);
  if(a > 1){
   a--;

  } else{
   a = 802;
  }
  pokeIndex = a.toString();
  getPokemon();
 }

 getPokemon(){
  pokemon = repository.getPokemon(pokeIndex).asObservable();
 }

}
