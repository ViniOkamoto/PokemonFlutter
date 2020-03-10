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
  fetchPokemons();
  getPokemon();
 }


 @action
 String increment() {
  int a = int.parse(pokeIndex);
  a++;
  return pokeIndex = a.toString();
 }

 getPokemon(){
  pokemon = repository.getPokemon("2").asObservable();
 }

 fetchPokemons(){
  pokemons = repository.getAllPokemons().asObservable();
 }
}
