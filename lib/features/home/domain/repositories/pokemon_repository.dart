import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemonList({int offset});
}
