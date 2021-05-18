import 'package:cloud_music/pages/home/domain/entity/song.dart';

import 'player_provider.dart';

abstract class IPlayerRepository {
  Future<List<Song>> getDailyRecSongs();
}

class PlayerRepository implements IPlayerRepository {
  PlayerRepository({required this.provider});
  final IPlayerProvider provider;

  @override
  Future<List<Song>> getDailyRecSongs() async {
    try {
      final cases = await provider.getDailyRecSongs();
      if (cases.status.hasError) {
        return Future.error(cases.statusText!);
      } else {
        return cases.body!;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
