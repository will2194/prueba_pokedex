import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_official_artwork_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonOfficialArtworkModel extends Equatable {
  final String frontDefault;
  final String frontShiny;

  const PokemonOfficialArtworkModel(this.frontDefault, this.frontShiny);

  Map<String, dynamic> toJson() => _$PokemonOfficialArtworkModelToJson(this);

  factory PokemonOfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonOfficialArtworkModelFromJson(json);

  static List<PokemonOfficialArtworkModel> fromJsonList(List<dynamic> list) =>
      list
          .map(
            (dynamic map) => PokemonOfficialArtworkModel.fromJson(
              map as Map<String, dynamic>,
            ),
          )
          .toList();

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
