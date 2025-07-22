import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_stat_info_model.dart';

part 'pokemon_stat_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonStatModel extends Equatable {
  final int baseStat;
  final PokemonStatInfoModel stat;

  const PokemonStatModel(this.baseStat, this.stat);

  Map<String, dynamic> toJson() => _$PokemonStatModelToJson(this);

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatModelFromJson(json);

  static List<PokemonStatModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) => PokemonStatModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [baseStat, stat];
}
