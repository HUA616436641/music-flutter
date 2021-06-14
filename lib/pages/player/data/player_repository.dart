import 'package:cloud_music/pages/player/entity/lyric.dart';

import 'player_provider.dart';

abstract class IPlayerRepository {
  Future<List<String>> getSongUrls(List<int> songIds);
  Future<Lyric?> getLyric(int songId);
}

class PlayerRepository implements IPlayerRepository {
  PlayerRepository({required this.provider});
  final IPlayerProvider provider;

  @override
  Future<List<String>> getSongUrls(List<int> songIds) async {
    try {
      final cases = await provider.getSongUrls(songIds);
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

  @override
  Future<Lyric?> getLyric(int songId) async {
    return (await provider.getLyric(songId)).body;
  }
}
