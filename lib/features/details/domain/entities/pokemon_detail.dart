import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_move.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_sprites.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_type.dart';

class PokemonDetail extends Equatable {
  final int id;
  final String name;
  final PokemonSprites sprites;
  final List<PokemonType> types;
  final int height;
  final int weight;
  final List<PokemonStat> stats;
  final List<PokemonMove> moves;

  const PokemonDetail({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
    required this.moves,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    sprites,
    types,
    height,
    weight,
    stats,
    moves,
  ];
}
