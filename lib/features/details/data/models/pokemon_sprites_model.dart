import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_other_sprites_model.dart';

part 'pokemon_sprites_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSpritesModel extends Equatable {
  final String frontDefault;
  final String frontShiny;
  final PokemonOtherSpritesModel other;

  const PokemonSpritesModel(this.frontDefault, this.frontShiny, this.other);

  Map<String, dynamic> toJson() => _$PokemonSpritesModelToJson(this);

  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesModelFromJson(json);

  static List<PokemonSpritesModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonSpritesModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [frontDefault, frontShiny, other];
}
