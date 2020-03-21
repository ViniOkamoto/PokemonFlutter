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
 @observable
 int pokeId;

 int indexUrl ;
 @action
  increment() {
  if(indexUrl != 10157){
   if(indexUrl == 807) {
    indexUrl = 10001;
   } else{
    indexUrl++;
   }
   pokeId ++;
  } else {
   indexUrl = 1;
   pokeId = 1;
  }
  pokeIndex = indexUrl.toString();
  getPokemon();

 }
 @action
  decrement() {
  if(indexUrl == 10001){
   indexUrl = 807;
   pokeId--;
  } else{
   if(indexUrl > 1){
    indexUrl--;
    pokeId--;
   } else{
    indexUrl = 10157;
    pokeId = 964;
   }
  }
  pokeIndex = indexUrl.toString();
  getPokemon();
 }

 getPokemon(){
  pokemon = repository.getPokemon(pokeIndex).asObservable();
 }

}
