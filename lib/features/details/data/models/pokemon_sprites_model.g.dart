// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_sprites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpritesModel _$PokemonSpritesModelFromJson(Map<String, dynamic> json) =>
    PokemonSpritesModel(
      json['front_default'] as String,
      json['front_shiny'] as String,
      PokemonOtherSpritesModel.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesModelToJson(
  PokemonSpritesModel instance,
) => <String, dynamic>{
  'front_default': instance.frontDefault,
  'front_shiny': instance.frontShiny,
  'other': instance.other,
};
