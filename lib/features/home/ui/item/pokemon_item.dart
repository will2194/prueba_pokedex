import 'package:flutter/material.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:prueba_pokedex/shared/constants/urls.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonItem({super.key, required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(getPokemonImage(pokemon.id)),
            ),
            title: Text(pokemon.name),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
