import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_other_sprites.dart';

class PokemonSprites extends Equatable {
  final String frontDefault;
  final String frontShiny;
  final PokemonOtherSprites other;

  const PokemonSprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.other,
  });

  @override
  List<Object?> get props => [frontDefault, frontShiny, other];
}
