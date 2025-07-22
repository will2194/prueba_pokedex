import 'package:prueba_pokedex/features/home/data/models/pokemon_model.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';

extension PokemonMapper on PokemonModel {
  Pokemon toEntity() => Pokemon(name: name, url: url);
}

extension PokemonModelMapper on Pokemon {
  PokemonModel toModel() => PokemonModel(name, url);
}
