import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pokedex/features/home/data/repositories/pokemon_repository_impl.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonRepositoryImpl();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

class PokemonListState {
  final List<Pokemon> pokemons;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int offset;

  PokemonListState({
    this.pokemons = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.offset = 0,
  });

  PokemonListState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? offset,
  }) {
    return PokemonListState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      offset: offset ?? this.offset,
    );
  }
}

class PokemonListViewModel extends StateNotifier<PokemonListState> {
  final PokemonRepository repository;
  final int _limit = 10;

  PokemonListViewModel(this.repository) : super(PokemonListState()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final pokemons = await repository.getPokemonList(offset: 0);

      state = state.copyWith(
        pokemons: pokemons,
        isLoading: false,
        offset: _limit,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.isLoading) return;

    state = state.copyWith(isLoadingMore: true);
    try {
      final newPokemons = await repository.getPokemonList(offset: state.offset);
      final updatedList = [...state.pokemons, ...newPokemons];
      state = state.copyWith(
        pokemons: updatedList,
        isLoadingMore: false,
        offset: state.offset + _limit,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }
}

// Provider del ViewModel
final homeViewModelProvider =
    StateNotifierProvider<PokemonListViewModel, PokemonListState>((ref) {
      final repo = ref.watch(pokemonRepositoryProvider);
      return PokemonListViewModel(repo);
    });
