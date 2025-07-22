import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_move_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_sprites_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_stat_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_type_model.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailModel extends Equatable {
  final int id;
  final String name;
  final PokemonSpritesModel sprites;
  final List<PokemonTypeModel> types;
  final int height;
  final int weight;
  final List<PokemonStatModel> stats;
  final List<PokemonMoveModel> moves;

  const PokemonDetailModel(
    this.id,
    this.name,
    this.sprites,
    this.types,
    this.height,
    this.weight,
    this.stats,
    this.moves,
  );

  Map<String, dynamic> toJson() => _$PokemonDetailModelToJson(this);

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);

  static List<PokemonDetailModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonDetailModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

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
