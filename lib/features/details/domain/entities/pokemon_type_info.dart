import 'package:equatable/equatable.dart';

class PokemonTypeInfo extends Equatable {
  final String name;

  const PokemonTypeInfo({required this.name});

  @override
  List<Object?> get props => [name];
}
