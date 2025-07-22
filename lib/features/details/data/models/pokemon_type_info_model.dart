import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonTypeInfoModel extends Equatable {
  final String name;

  const PokemonTypeInfoModel(this.name);

  Map<String, dynamic> toJson() => _$PokemonTypeInfoModelToJson(this);

  factory PokemonTypeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoModelFromJson(json);

  static List<PokemonTypeInfoModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) =>
            PokemonTypeInfoModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [name];
}
