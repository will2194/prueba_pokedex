import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:http/http.dart';
import 'package:prueba_pokedex/features/home/data/failures/pokemon_failures.dart';
import 'package:prueba_pokedex/features/home/data/models/pokemon_model.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:prueba_pokedex/features/home/domain/mappers/pokemon_mapper.dart';
import 'package:prueba_pokedex/features/home/domain/repositories/pokemon_repository.dart';
import 'package:prueba_pokedex/shared/constants/urls.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  static final String baseUrl = api_base_url;

  PokemonRepositoryImpl();

  @override
  Future<List<Pokemon>> getPokemonList({int offset = 0}) async {
    final perPage = 10;
    final Response response = await client.get(
      Uri.parse('$baseUrl/pokemon?offset=$offset&limit=$perPage'),
      headers: {'Content-Type': 'application/json'},
    );
    final decoded = jsonDecode(response.body);
    final results = decoded['results'];
    if (response.statusCode != 200) {
      throw PokemonUnexpectedFailure();
    }

    final data = results as List<dynamic>;
    final pokemonList = PokemonModel.fromJsonList(data);

    return pokemonList.map((e) => e.toEntity()).toList();
  }
}
