import 'package:cloud_music/common/provider/base_provider.dart';
import 'package:cloud_music/pages/home/domain/entity/banner.dart';
import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:get/get.dart';

// ignore: one_member_abstracts
abstract class IDailyRecProvider {
  Future<Response<List<Song>>> getDailyRecSongs();
}

class DailyRecProvider extends BaseProvider implements IDailyRecProvider {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://netease-cloud-music-api-murex.vercel.app';
    super.onInit();
  }

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
    print(res['data']['dailySongs'].last);
    return (res['recommend'] as List)
        .map(
          (e) => Song.fromJson(e),
        )
        .toList();
  }
}
