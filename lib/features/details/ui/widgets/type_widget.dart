import 'package:flutter/material.dart';
import 'package:prueba_pokedex/shared/utils/extencions.dart';

class TypeWidget extends StatelessWidget {
  final String typeName;

  const TypeWidget({super.key, required this.typeName});

  @override
  Widget build(BuildContext context) {
    final color = typeName.pokemonBackgroundColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        typeName.toUpperCase(),
        style: TextStyle(
          color: color == Colors.white ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
