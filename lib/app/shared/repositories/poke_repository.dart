import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:slidy_structure/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<PokemonModel> getPokemon(String url) async {
    var response = await dio.get('/pokemon/$url');

      PokemonModel pokemon = PokemonModel.fromJson(response.data);
      
      return pokemon;
    }


  Future<List<PokemonModel>> getAllPokemons({String offset}) async {
    var response = await dio.get('/pokemon?offset=0&limit=20');
    List<PokemonModel> list = [];
   try{
     for(var json in (response.data['results'] as List)){
       String url = json['url'];
       PokemonModel pokemon = await getPokemon(url.split("/").elementAt(6));
       list.add(pokemon);
     }
     return list;
   }catch(error){
     return error;
   }
  }


}