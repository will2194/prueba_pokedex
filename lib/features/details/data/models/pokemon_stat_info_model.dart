import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonStatInfoModel extends Equatable {
  final String name;

  const PokemonStatInfoModel(this.name);

  Map<String, dynamic> toJson() => _$PokemonStatInfoModelToJson(this);

  factory PokemonStatInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoModelFromJson(json);

  static List<PokemonStatInfoModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonStatInfoModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [name];
}
