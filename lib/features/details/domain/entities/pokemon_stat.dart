import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat_info.dart';

class PokemonStat extends Equatable {
  final int baseStat;
  final PokemonStatInfo stat;

  const PokemonStat({required this.baseStat, required this.stat});

  @override
  List<Object?> get props => [baseStat, stat];
}
