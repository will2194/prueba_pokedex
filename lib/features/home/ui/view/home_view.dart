import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pokedex/features/details/ui/view/detail_view.dart';
import 'package:prueba_pokedex/features/home/ui/item/pokemon_item.dart';
import 'package:prueba_pokedex/features/home/ui/viewmodel/home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeView();
}

class _HomeView extends ConsumerState<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(homeViewModelProvider.notifier);
    if (notifier.currentOrder == SortOrder.id &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !ref.read(homeViewModelProvider).isLoadingMore) {
      notifier.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(homeViewModelProvider.notifier);
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: Color(0xFFDC0A2D),
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: searchBar()),
              PopupMenuButton<SortOrder>(
                onSelected: (order) {
                  notifier.toggleSortOrder(order);
                },
                icon: const Icon(Icons.sort, color: Colors.white),
                color: Colors.white,
                iconSize: 40,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: SortOrder.id,
                    child: Row(
                      children: [
                        Icon(
                          Icons.numbers,
                          color: notifier.currentOrder == SortOrder.id
                              ? Color(0xFFDC0A2D)
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Ordenar por Numero',
                          style: TextStyle(
                            color: notifier.currentOrder == SortOrder.id
                                ? Color(0xFFDC0A2D)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: SortOrder.alphabetical,
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort_by_alpha,
                          color: notifier.currentOrder == SortOrder.alphabetical
                              ? Color(0xFFDC0A2D)
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Orden alfabético',
                          style: TextStyle(
                            color:
                                notifier.currentOrder == SortOrder.alphabetical
                                ? Color(0xFFDC0A2D)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
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
          margin: const EdgeInsets.all(4.0),
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: state.pokemons.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.pokemons.length) {
                      final pokemon = state.pokemons[index];
                      return PokemonItem(
                        pokemon: pokemon,
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(
                                milliseconds: 600,
                              ),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DetailView(pokemon: pokemon),
                              transitionsBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    final fade = Tween(
                                      begin: 0.0,
                                      end: 1.0,
                                    ).animate(animation);
                                    final scale = Tween(begin: 0.9, end: 1.0)
                                        .animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOut,
                                          ),
                                        );

                                    return FadeTransition(
                                      opacity: fade,
                                      child: ScaleTransition(
                                        scale: scale,
                                        child: child,
                                      ),
                                    );
                                  },
                            ),
                          );
                        },
                      );
                    } else {
                      return state.isLoadingMore
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : const SizedBox.shrink();
                    }
                  },
                ),
        ),
      ),
    );
  }

  Widget searchBar() {
    final notifier = ref.read(homeViewModelProvider.notifier);
    final state = ref.watch(homeViewModelProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar Pokémon',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        onChanged: (value) {
          final query = value.trim().toLowerCase();
          if (query.isEmpty && state.pokemons.length <= 1) {
            notifier.loadInitial();
          }
        },
        onSubmitted: (value) {
          final query = value.trim().toLowerCase();
          if (query.isNotEmpty) {
            notifier.searchPokemons(value);
          } else {
            notifier.loadInitial();
          }
        },
      ),
    );
  }
}
