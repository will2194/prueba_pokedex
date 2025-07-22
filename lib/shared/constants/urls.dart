final String apiBaseUrl = 'https://pokeapi.co/api/v2';
String getPokemonImage(pokeId) =>
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokeId.png';
String searchPokemonUrl(pokeId) => 'https://pokeapi.co/api/v2/pokemon/$pokeId/';
