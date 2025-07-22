import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonMoveDetailModel extends Equatable {
  final String name;

  const PokemonMoveDetailModel(this.name);

  Map<String, dynamic> toJson() => _$PokemonMoveDetailModelToJson(this);

  factory PokemonMoveDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveDetailModelFromJson(json);

  static List<PokemonMoveDetailModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonMoveDetailModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [name];
}
