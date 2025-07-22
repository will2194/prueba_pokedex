import 'package:flutter/material.dart';

extension PokemonTypeColor on String {
  Color get pokemonBackgroundColor {
    switch (toLowerCase()) {
      case 'normal':
        return Color(0xFFAAA67F);
      case 'fire':
        return Color(0xFFF57D31);
      case 'water':
        return Color(0xFF6493EB);
      case 'electric':
        return Color(0xFFF9CF30);
      case 'grass':
        return Color(0xFF74CB48);
      case 'ice':
        return Color(0xFF9AD6DF);
      case 'fighting':
        return Color(0xFFC12239);
      case 'poison':
        return Color(0xFFA43E9E);
      case 'ground':
        return Color(0xFFDEC16B);
      case 'flying':
        return Color(0xFFA891EC);
      case 'psychic':
        return Color(0xFFFB5584);
      case 'bug':
        return Color(0xFFA7B723);
      case 'rock':
        return Color(0xFFB69E31);
      case 'ghost':
        return Color(0xFF70559B);
      case 'dragon':
        return Color(0xFF7037FF);
      case 'dark':
        return Color(0xFF75574C);
      case 'steel':
        return Color(0xFFB7B9D0);
      case 'fairy':
        return Color(0xFFE69EAC);
      default:
        return Color(0xFFDC0A2D);
    }
  }

  String get shortLabel {
    switch (this) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SpA';
      case 'special-defense':
        return 'SpD';
      case 'speed':
        return 'SPD';
      default:
        return '?';
    }
  }
}
