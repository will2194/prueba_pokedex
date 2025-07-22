import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_type_info_model.dart';

part 'pokemon_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonTypeModel extends Equatable {
  final int slot;
  final PokemonTypeInfoModel type;

  const PokemonTypeModel(this.slot, this.type);

  Map<String, dynamic> toJson() => _$PokemonTypeModelToJson(this);

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeModelFromJson(json);

  static List<PokemonTypeModel> fromJsonList(List<dynamic> list) => list
      .map(
        (dynamic map) => PokemonTypeModel.fromJson(map as Map<String, dynamic>),
      )
      .toList();

  @override
  List<Object?> get props => [slot, type];
}
