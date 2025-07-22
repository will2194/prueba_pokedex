import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_type_info.dart';

class PokemonType extends Equatable {
  final int slot;
  final PokemonTypeInfo type;

  const PokemonType({required this.slot, required this.type});

  @override
  List<Object?> get props => [slot, type];
}
