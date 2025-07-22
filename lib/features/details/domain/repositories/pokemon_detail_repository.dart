import 'package:prueba_pokedex/features/details/domain/entities/pokemon_detail.dart';

abstract class PokemonDetailRepository {
  Future<PokemonDetail> getPokemonDetail({String urlDetail = ""});
}
