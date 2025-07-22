import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pokedex/features/details/ui/viewmodel/detail_view_model.dart';

class ImageSwitcherWidget extends ConsumerWidget {
  final String normalImageUrl;
  final String shinyImageUrl;
  final Color color;

  const ImageSwitcherWidget({
    super.key,
    required this.normalImageUrl,
    required this.shinyImageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showShiny = ref.watch(showShinyProvider);

    final spriteUrl = showShiny ? shinyImageUrl : normalImageUrl;

    return Stack(
      children: [
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Image.network(
              spriteUrl,
              key: ValueKey(spriteUrl),
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 100, color: Colors.red),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: () =>
                ref.read(showShinyProvider.notifier).state = !showShiny,
            style: ElevatedButton.styleFrom(foregroundColor: color),
            child: Text(!showShiny ? "Ver Shiny" : "Ver Normal"),
          ),
        ),
      ],
    );
  }
}
