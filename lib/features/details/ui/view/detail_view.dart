import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat.dart';
import 'package:prueba_pokedex/shared/utils/extencions.dart';
import '../viewmodel/detail_view_model.dart';

class DetailView extends ConsumerWidget {
  final String name;
  final String url;

  const DetailView({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(url));
    final showShiny = ref.watch(showShinyProvider);

    return Scaffold(
      backgroundColor: state.details == null
          ? Colors.redAccent
          : state.details!.types.first.type.name.pokemonBackgroundColor,
      appBar: AppBar(
        title: Text(
          name.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            state.isLoading
                ? Expanded(
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : state.error != null
                ? Expanded(child: Center(child: Text('Error: ${state.error}')))
                : Column(
                    children: [
                      const SizedBox(height: 150),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: state.details!.types.map((t) {
                                    final color =
                                        t.type.name.pokemonBackgroundColor;
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        t.type.name.toUpperCase(),
                                        style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 20),
                                // About section
                                Text(
                                  "About",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: state
                                        .details!
                                        .types
                                        .first
                                        .type
                                        .name
                                        .pokemonBackgroundColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.monitor_weight_outlined,
                                        ),
                                        Text(
                                          "${state.details!.weight / 10} kg",
                                        ),
                                        const Text(
                                          "Weight",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Icon(Icons.height),
                                        Text("${state.details!.height / 10} m"),
                                        const Text(
                                          "Height",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "Base Stats",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: state
                                        .details!
                                        .types
                                        .first
                                        .type
                                        .name
                                        .pokemonBackgroundColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // Stats
                                ...state.details!.stats.map(
                                  (stat) => _StatBar(stat: stat),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            // Imagen del Pokémon
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Image.network(
                  state.details!.sprites.frontDefault,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network(state.details!.sprites.frontDefault),
                      Text('ID: ${state.details!.id}'),
                      Text('Altura: ${state.details!.height}'),
                      Text('Peso: ${state.details!.weight}'),
                      Text('Tipos: ${state.details!.types.join(', ')}'),
                      const SizedBox(height: 16),
                      const Text(
                        'Estadísticas:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...state.details!.stats.map(
                        (s) => Text('${s.stat.name}: ${s.baseStat}'),
                      ),
                    ],
                  ),
                ),
*/

class _StatBar extends StatelessWidget {
  final PokemonStat stat;

  const _StatBar({required this.stat});

  @override
  Widget build(BuildContext context) {
    final value = stat.baseStat;
    final label = stat.stat.name.toUpperCase();
    final color = Colors.green; // Puedes personalizar según tipo de stat

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 32, child: Text(value.toString())),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
