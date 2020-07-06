// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexController on _PokedexControllerBase, Store {
  final _$pokemonsAtom = Atom(name: '_PokedexControllerBase.pokemons');

  @override
  ObservableFuture<List<PokemonModel>> get pokemons {
    _$pokemonsAtom.context.enforceReadPolicy(_$pokemonsAtom);
    _$pokemonsAtom.reportObserved();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableFuture<List<PokemonModel>> value) {
    _$pokemonsAtom.context.conditionallyRunInAction(() {
      super.pokemons = value;
      _$pokemonsAtom.reportChanged();
    }, _$pokemonsAtom, name: '${_$pokemonsAtom.name}_set');
  }

  final _$pokemonAtom = Atom(name: '_PokedexControllerBase.pokemon');

  @override
  ObservableFuture<PokemonModel> get pokemon {
    _$pokemonAtom.context.enforceReadPolicy(_$pokemonAtom);
    _$pokemonAtom.reportObserved();
    return super.pokemon;
  }

  @override
  set pokemon(ObservableFuture<PokemonModel> value) {
    _$pokemonAtom.context.conditionallyRunInAction(() {
      super.pokemon = value;
      _$pokemonAtom.reportChanged();
    }, _$pokemonAtom, name: '${_$pokemonAtom.name}_set');
  }

  final _$pokeIndexAtom = Atom(name: '_PokedexControllerBase.pokeIndex');

  @override
  String get pokeIndex {
    _$pokeIndexAtom.context.enforceReadPolicy(_$pokeIndexAtom);
    _$pokeIndexAtom.reportObserved();
    return super.pokeIndex;
  }

  @override
  set pokeIndex(String value) {
    _$pokeIndexAtom.context.conditionallyRunInAction(() {
      super.pokeIndex = value;
      _$pokeIndexAtom.reportChanged();
    }, _$pokeIndexAtom, name: '${_$pokeIndexAtom.name}_set');
  }

  final _$pokeIdAtom = Atom(name: '_PokedexControllerBase.pokeId');

  @override
  int get pokeId {
    _$pokeIdAtom.context.enforceReadPolicy(_$pokeIdAtom);
    _$pokeIdAtom.reportObserved();
    return super.pokeId;
  }

  @override
  set pokeId(int value) {
    _$pokeIdAtom.context.conditionallyRunInAction(() {
      super.pokeId = value;
      _$pokeIdAtom.reportChanged();
    }, _$pokeIdAtom, name: '${_$pokeIdAtom.name}_set');
  }

  final _$_PokedexControllerBaseActionController =
      ActionController(name: '_PokedexControllerBase');

  @override
  dynamic increment() {
    final _$actionInfo = _$_PokedexControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_PokedexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrement() {
    final _$actionInfo = _$_PokedexControllerBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_PokedexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokemons: ${pokemons.toString()},pokemon: ${pokemon.toString()},pokeIndex: ${pokeIndex.toString()},pokeId: ${pokeId.toString()}';
    return '{$string}';
  }
}
