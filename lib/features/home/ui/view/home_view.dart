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
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !ref.read(homeViewModelProvider).isLoadingMore) {
      ref.read(homeViewModelProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    final filteredList = state.pokemons.where((pokemon) {
      return pokemon.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

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
              /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_list, color: Colors.white),
              ),*/
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
                  itemCount: filteredList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < filteredList.length) {
                      final pokemon = filteredList[index];
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
        onChanged: (value) =>
            ref.read(searchQueryProvider.notifier).state = value,
      ),
    );
  }
}
