import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_move_detail.dart';

class PokemonMove extends Equatable {
  final PokemonMoveDetail move;

  const PokemonMove({required this.move});

  @override
  List<Object?> get props => [move];
}
