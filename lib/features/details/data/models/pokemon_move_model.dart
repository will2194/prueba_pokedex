import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_move_detail_model.dart';

part 'pokemon_move_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonMoveModel extends Equatable {
  final PokemonMoveDetailModel move;

  const PokemonMoveModel(this.move);

  Map<String, dynamic> toJson() => _$PokemonMoveModelToJson(this);

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveModelFromJson(json);

  static List<PokemonMoveModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) => PokemonMoveModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [move];
}
