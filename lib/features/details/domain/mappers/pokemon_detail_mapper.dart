import 'package:prueba_pokedex/features/details/data/models/pokemon_detail_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_move_detail_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_move_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_official_artwork_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_other_sprites_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_sprites_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_stat_info_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_stat_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_type_info_model.dart';
import 'package:prueba_pokedex/features/details/data/models/pokemon_type_model.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_detail.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_move.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_move_detail.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_official_artwork.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_other_sprites.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_sprites.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_stat_info.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_type.dart';
import 'package:prueba_pokedex/features/details/domain/entities/pokemon_type_info.dart';

extension PokemonDetailMapper on PokemonDetailModel {
  PokemonDetail toEntity() => PokemonDetail(
    id: id,
    name: name,
    height: height,
    weight: weight,
    sprites: sprites.toEntity(),
    stats: stats.map((stat) => stat.toEntity()).toList(),
    types: types.map((type) => type.toEntity()).toList(),
    moves: moves.map((move) => move.toEntity()).toList(),
  );
}

extension PokemonSpritesMapper on PokemonSpritesModel {
  PokemonSprites toEntity() => PokemonSprites(
    frontDefault: frontDefault,
    frontShiny: frontShiny,
    other: other.toEntity(),
  );
}

extension PokemonOtherSpritesMapper on PokemonOtherSpritesModel {
  PokemonOtherSprites toEntity() =>
      PokemonOtherSprites(officialArtwork: officialArtwork.toEntity());
}

extension PokemonOfficialArtworkMapper on PokemonOfficialArtworkModel {
  PokemonOfficialArtwork toEntity() => PokemonOfficialArtwork(
    frontDefault: frontDefault,
    frontShiny: frontShiny,
  );
}

extension PokemonStatMapper on PokemonStatModel {
  PokemonStat toEntity() =>
      PokemonStat(baseStat: baseStat, stat: stat.toEntity());
}

extension PokemonStatInfoMapper on PokemonStatInfoModel {
  PokemonStatInfo toEntity() => PokemonStatInfo(name: name);
}

extension PokemonTypeMapper on PokemonTypeModel {
  PokemonType toEntity() => PokemonType(slot: slot, type: type.toEntity());
}

extension PokemonTypeInfoMapper on PokemonTypeInfoModel {
  PokemonTypeInfo toEntity() => PokemonTypeInfo(name: name);
}

extension PokemonMoveMapper on PokemonMoveModel {
  PokemonMove toEntity() => PokemonMove(move: move.toEntity());
}

extension PokemonMoveDetailMapper on PokemonMoveDetailModel {
  PokemonMoveDetail toEntity() => PokemonMoveDetail(name: name);
}
