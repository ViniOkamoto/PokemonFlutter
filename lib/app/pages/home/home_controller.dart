import 'package:mobx/mobx.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;


  @observable
  ObservableFuture<List<PokemonModel>> pokemons;
  ObservableFuture<PokemonModel> pokemon;
  String pokeIndex;

  _HomeControllerBase(this.repository) {
    fetchPokemons();
  }


  @action
  String increment() {
    int a = int.parse(pokeIndex);
    a++;
    return pokeIndex = a.toString();
  }


  fetchPokemons(){
    pokemons = repository.getAllPokemons().asObservable();
  }

}
