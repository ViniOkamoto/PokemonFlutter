import 'package:mobx/mobx.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  ObservableFuture<PokemonModel> pokemon;
  String pokeIndex;

  @observable
  int offset = 0;
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
    repository.getAllPokemons(offset: offset.toString()).then((value) => value.forEach((element) {
      pokemons.add(element);
    }));
    offset += 20;
  }

}
