import 'package:equatable/equatable.dart';

class PokemonSprites extends Equatable {
  final String frontDefault;
  final String frontShiny;

  const PokemonSprites({required this.frontDefault, required this.frontShiny});

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
