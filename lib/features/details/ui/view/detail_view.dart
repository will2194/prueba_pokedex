import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat.dart';
import 'package:prueba_pokedex/features/details/ui/widgets/about_widget.dart';
import 'package:prueba_pokedex/features/details/ui/widgets/image_switcher_widget.dart';
import 'package:prueba_pokedex/features/details/ui/widgets/stat_widget.dart';
import 'package:prueba_pokedex/features/details/ui/widgets/type_widget.dart';
import 'package:prueba_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:prueba_pokedex/shared/utils/extencions.dart';
import '../viewmodel/detail_view_model.dart';

class DetailView extends ConsumerWidget {
  final Pokemon pokemon;

  const DetailView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(pokemon.url));
    double width = MediaQuery.sizeOf(context).width;

    Color color = state.details == null
        ? Color(0xFFDC0A2D)
        : state.details!.types.first.type.name.pokemonBackgroundColor;

    return state.isLoading
        ? Scaffold(body: const Center(child: CircularProgressIndicator()))
        : Scaffold(
            backgroundColor: color,
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    child: AppBar(
                      title: Text(
                        pokemon.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            "#${pokemon.id.toString().padLeft(4, '0')}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  state.error != null
                      ? Expanded(
                          child: Center(child: Text('Error: ${state.error}')),
                        )
                      : Column(
                          children: [
                            Container(
                              height: 200,
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                "assets/images/pokeball.svg",
                                semanticsLabel: 'Pokeball',
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withAlpha(30),
                                  BlendMode.srcIn,
                                ),
                                height: 200,
                                width: width / 2,
                                fit: BoxFit.cover,
                              ),
                            ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: state.details!.types.map((t) {
                                          return TypeWidget(
                                            typeName: t.type.name,
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
                                          color: color,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AboutWidget(
                                            title: "Weight",
                                            description:
                                                "${state.details!.weight / 10} kg",
                                            icon: Icons.monitor_weight_outlined,
                                          ),
                                          Column(
                                            children: [
                                              ...state.details!.moves
                                                  .take(2)
                                                  .map((move) {
                                                    return Text(
                                                      move.move.name
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    );
                                                  }),
                                              const SizedBox(height: 4),
                                              Text(
                                                "Moves",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          AboutWidget(
                                            title: "Height",
                                            description:
                                                "${state.details!.height / 10} m",
                                            icon: Icons.height,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Text(
                                        "Base Stats",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: color,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      buildStats(state.details!.stats, color),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  state.details == null
                      ? const SizedBox()
                      : Positioned(
                          top: 50,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: ImageSwitcherWidget(
                              normalImageUrl: state
                                  .details!
                                  .sprites
                                  .other
                                  .officialArtwork
                                  .frontDefault,
                              shinyImageUrl: state
                                  .details!
                                  .sprites
                                  .other
                                  .officialArtwork
                                  .frontShiny,
                              color: color,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
  }

  Widget buildStats(List<PokemonStat> stats, Color color) {
    if (stats.isEmpty) {
      return const Center(child: Text("No stats available"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        ...stats.asMap().entries.map((entry) {
          final index = entry.key;
          final stat = entry.value;
          return StatWidget(
            label: stat.stat.name,
            value: stat.baseStat,
            delayMs: index * 250,
            color: color,
          );
        }),
      ],
    );
  }
}
