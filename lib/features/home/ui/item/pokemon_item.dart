import 'package:flutter/material.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:prueba_pokedex/shared/constants/urls.dart';

Widget pokemonItem(Pokemon pokemon) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(getPokemonImage(pokemon.id)),
          ),
          title: Text(pokemon.name),
        ),
      ],
    ),
  );
}
