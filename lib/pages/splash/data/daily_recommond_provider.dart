import 'package:cloud_music/pages/home/domain/entity/banner.dart';
import 'package:get/get.dart';

// ignore: one_member_abstracts
abstract class IDailyRecProvider {
  Future<Response<List<SongList>>> getDailyRecSongs();
}

class DailyRecProvider extends GetConnect implements IDailyRecProvider {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://netease-cloud-music-api-murex.vercel.app';
  }

  @override
  Future<Response<List<SongList>>> getDailyRecSongs() {
    return get('/recommend/resource', decoder: parseSongList);
    // try {
    //   final res = await get('/recommend/resource', decoder: parseSongList);
    //   return res;
    // } catch (e) {
    //   print(e.toString());
    //   return Future.value(Response<List<SongList>>(body: []));
    // }
  }

  List<SongList> parseSongList(json) {
    final res = json as Map<String, dynamic>;
    if (res['code'] == 200) {
      return (res['result'] as List)
          .map(
            (e) => SongList.fromJson(e),
          )
          .toList();
    } else {
      return [];
    }
  }
}
