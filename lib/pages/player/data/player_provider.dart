import 'package:cloud_music/common/provider/base_provider.dart';
import 'package:cloud_music/pages/player/entity/lyric.dart';
import 'package:get/get.dart';

abstract class IPlayerProvider {
  Future<Response<List<String>>> getSongUrls(List<int> songIds);
  Future<Response<Lyric>> getLyric(songId);
}

class PlayerProvider extends BaseProvider implements IPlayerProvider {
  @override
  Future<Response<List<String>>> getSongUrls(List<int> songIds) {
    final query = {'id': songIds.join(',')};
    return get('/song/url',
        query: query, decoder: (json) => parseSongList(songIds, json));
  }

  List<String> parseSongList(List<int> songIds, json) {
    final res = json as Map<String, dynamic>;
    final songList = res['data'] as List;
    return songIds.map((e) {
      final originData = songList.firstWhere((element) => element['id'] == e);
      return originData['url'] as String;
    }).toList();
  }

  @override
  Future<Response<Lyric>> getLyric(songId) {
    final query = {'id': songId.toString()};
    return get('/lyric', query: query, decoder: parseLyric);
  }

  Lyric parseLyric(json) {
    final res = json as Map<String, dynamic>;
    return Lyric(lrcStr: res['lrc']?['lyric']);
  }
}
