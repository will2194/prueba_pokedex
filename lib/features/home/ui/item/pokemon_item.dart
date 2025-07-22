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
      child: ListTile(
        leading: Image.network(
          getPokemonImage(pokemon.id),
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error, size: 40, color: Colors.red),
        ),
        title: Text(pokemon.name),
        subtitle: Text("#${pokemon.id.toString().padLeft(4, '0')}"),
        onTap: onTap,
      ),
    );
  }
}
