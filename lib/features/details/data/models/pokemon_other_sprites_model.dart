import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_official_artwork_model.dart';

part 'pokemon_other_sprites_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class PokemonOtherSpritesModel extends Equatable {
  final PokemonOfficialArtworkModel officialArtwork;

  const PokemonOtherSpritesModel(this.officialArtwork);

  Map<String, dynamic> toJson() => _$PokemonOtherSpritesModelToJson(this);

  factory PokemonOtherSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesModelFromJson(json);

  static List<PokemonOtherSpritesModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonOtherSpritesModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [officialArtwork];
}
