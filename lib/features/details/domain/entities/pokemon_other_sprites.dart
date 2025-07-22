import 'package:equatable/equatable.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_official_artwork.dart';

class PokemonOtherSprites extends Equatable {
  final PokemonOfficialArtwork officialArtwork;

  const PokemonOtherSprites({required this.officialArtwork});

  @override
  List<Object?> get props => [officialArtwork];
}
