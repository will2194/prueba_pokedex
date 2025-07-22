import 'package:equatable/equatable.dart';

class PokemonStatInfo extends Equatable {
  final String name;

  const PokemonStatInfo({required this.name});

  @override
  List<Object?> get props => [name];
}
