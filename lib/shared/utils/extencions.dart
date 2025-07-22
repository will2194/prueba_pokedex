import 'package:flutter/material.dart';

extension PokemonTypeColor on String {
  Color get pokemonBackgroundColor {
    switch (toLowerCase()) {
      case 'normal':
        return Colors.white;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blueAccent;
      case 'electric':
        return Colors.amber;
      case 'grass':
        return Colors.green;
      case 'ice':
        return Colors.cyanAccent;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.brown;
      case 'flying':
        return Colors.grey;
      case 'psychic':
        return Colors.pinkAccent;
      case 'bug':
        return Colors.lightGreen;
      case 'rock':
        return Colors.brown;
      case 'ghost':
        return Colors.deepPurple;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.black;
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
