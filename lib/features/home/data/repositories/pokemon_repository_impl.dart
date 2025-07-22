import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:http/http.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_detail_model.dart';
import 'package:prueba_pokedex/features/details/domain/mappers/pokemon_detail_mapper.dart';
import 'package:prueba_pokedex/features/home/data/failures/pokemon_failures.dart';
import 'package:prueba_pokedex/features/home/data/models/pokemon_model.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:prueba_pokedex/features/home/domain/mappers/pokemon_mapper.dart';
import 'package:prueba_pokedex/features/home/domain/repositories/pokemon_repository.dart';
import 'package:prueba_pokedex/shared/constants/urls.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  static final String baseUrl = apiBaseUrl;

  PokemonRepositoryImpl();

  @override
  Future<List<Pokemon>> getPokemonList({int offset = 0}) async {
    final perPage = 20;
    final Response response = await client.get(
      Uri.parse('$baseUrl/pokemon?offset=$offset&limit=$perPage'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final results = decoded['results'];

      final data = results as List<dynamic>;
      final pokemonList = PokemonModel.fromJsonList(data);

      return pokemonList.map((e) => e.toEntity()).toList();
    } else {
      throw PokemonUnexpectedFailure();
    }
  }

  @override
  Future<List<Pokemon>> searchPokemons({String name = ""}) async {
    final Response response = await client.get(
      Uri.parse('$baseUrl/pokemon/$name'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      final data = decoded as Map<String, dynamic>;
      final pokemonDetail = PokemonDetailModel.fromJson(data);

      return [pokemonDetail.toPokemonEntity()];
    } else {
      throw PokemonNotFoundFailure();
    }
  }

  @override
  Future<List<Pokemon>> sortByName() async {
    final Response response = await client.get(
      Uri.parse('$baseUrl/pokemon?offset=0&limit=151'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final results = decoded['results'];

      final data = results as List<dynamic>;
      final pokemonList = PokemonModel.fromJsonList(data);

      return pokemonList.map((e) => e.toEntity()).toList();
    } else {
      throw PokemonUnexpectedFailure();
    }
  }
}
