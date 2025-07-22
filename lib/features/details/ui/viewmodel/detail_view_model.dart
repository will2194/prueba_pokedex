import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pokedex/features/details/data/repositories/pokemon_detail_repository_impl.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_detail.dart';
import 'package:prueba_pokedex/features/details/domain/repositories/pokemon_detail_repository.dart';

final pokemonDetailRepositoryProvider = Provider<PokemonDetailRepository>((
  ref,
) {
  return PokemonDetailRepositoryImpl();
});

final showShinyProvider = StateProvider<bool>((ref) => false);

class PokemonDetailState {
  final PokemonDetail? details;
  final bool isLoading;
  final String? error;

  PokemonDetailState({this.details, this.isLoading = false, this.error});

  PokemonDetailState copyWith({
    PokemonDetail? details,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? offset,
  }) {
    return PokemonDetailState(
      details: details ?? this.details,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class PokemonDetailViewModel extends StateNotifier<PokemonDetailState> {
  final PokemonDetailRepository repository;
  final String url;

  PokemonDetailViewModel(this.repository, this.url)
    : super(PokemonDetailState()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final details = await repository.getPokemonDetail(urlDetail: url);

      state = state.copyWith(details: details, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final detailViewModelProvider =
    StateNotifierProvider.family<
      PokemonDetailViewModel,
      PokemonDetailState,
      String
    >((ref, url) {
      final repo = ref.watch(pokemonDetailRepositoryProvider);
      return PokemonDetailViewModel(repo, url);
    });
