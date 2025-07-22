// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMoveModel _$PokemonMoveModelFromJson(Map<String, dynamic> json) =>
    PokemonMoveModel(
      PokemonMoveDetailModel.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonMoveModelToJson(PokemonMoveModel instance) =>
    <String, dynamic>{'move': instance.move};
