import 'package:equatable/equatable.dart';

class PokemonMoveDetail extends Equatable {
  final String name;

  const PokemonMoveDetail({required this.name});

  @override
  List<Object?> get props => [name];
}
