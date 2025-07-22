import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_pokedex/features/details/data/failures/pokemon_detail_failures.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_detail_model.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_detail.dart';
import 'package:prueba_pokedex/features/details/domain/repositories/pokemon_detail_repository.dart';
import 'package:prueba_pokedex/features/details/domain/mappers/pokemon_detail_mapper.dart';

class PokemonDetailRepositoryImpl extends PokemonDetailRepository {
  @override
  Future<PokemonDetail> getPokemonDetail({String urlDetail = ""}) async {
    final url = Uri.parse(urlDetail);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      final data = decoded as Map<String, dynamic>;
      final pokemonDetail = PokemonDetailModel.fromJson(data);

      return pokemonDetail.toEntity();
    } else {
      throw PokemonDetailNotFoundFailure();
    }
  }
}
