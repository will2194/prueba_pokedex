// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatModel _$PokemonStatModelFromJson(Map<String, dynamic> json) =>
    PokemonStatModel(
      (json['base_stat'] as num).toInt(),
      PokemonStatInfoModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatModelToJson(PokemonStatModel instance) =>
    <String, dynamic>{'base_stat': instance.baseStat, 'stat': instance.stat};
