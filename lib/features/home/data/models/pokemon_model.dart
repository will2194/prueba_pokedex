import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonModel extends Equatable {
  final String name;
  final String url;

  const PokemonModel(this.name, this.url);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  static List<PokemonModel> fromJsonList(List<dynamic> list) => list
      .map((dynamic map) => PokemonModel.fromJson(map as Map<String, dynamic>))
      .toList();

  @override
  List<Object?> get props => [name, url];
}
