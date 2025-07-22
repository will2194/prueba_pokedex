import 'package:equatable/equatable.dart';

class PokemonOfficialArtwork extends Equatable {
  final String frontDefault;
  final String frontShiny;

  const PokemonOfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
