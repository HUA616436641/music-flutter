import 'package:cloud_music/common/provider/base_provider.dart';
import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:get/get.dart';

// ignore: one_member_abstracts
abstract class IPlayerProvider {
  Future<Response<List<Song>>> getDailyRecSongs();
}

class PlayerProvider extends BaseProvider implements IPlayerProvider {
  @override
  Future<Response<List<Song>>> getDailyRecSongs() {
    return get('/recommend/songs', decoder: parseSongList);
    // try {
    //   final res = await get('/recommend/resource', decoder: parseSongList);
    //   return res;
    // } catch (e) {
    //   print(e.toString());
    //   return Future.value(Response<List<SongList>>(body: []));
    // }
  }

  List<Song> parseSongList(json) {
    final res = json as Map<String, dynamic>;
    return (res['data']['dailySongs'] as List)
        .map((e) => Song.fromJson(e))
        .toList();
  }
}
