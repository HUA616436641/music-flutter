import 'package:get/get.dart';
import 'package:cloud_music/pages/home/domain/entity/banner.dart';

// ignore: one_member_abstracts
abstract class IHomeProvider {
  Future<Response<List<SwiperBanner>>> getBanner();
  Future<Response<List<SongList>>> getSongList();
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://netease-cloud-music-api-murex.vercel.app';
  }

  @override
  Future<Response<List<SwiperBanner>>> getBanner() =>
      get('/banner?type=2', decoder: parseBanner);

  List<SwiperBanner> parseBanner(json) {
    final res = json as Map<String, dynamic>;
    if (res['code'] == 200) {
      return (res['banners'] as List)
          .map(
            (e) => SwiperBanner(
                id: e['bannerId'] as String, url: e['pic'] as String),
          )
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<Response<List<SongList>>> getSongList() {
    return get('/personalized?limit=10', decoder: parseSongList);
  }

  // {id: 2409342460, type: 0, name: [一周新歌推荐]  徐佳莹深情演绎家人之间专属独白, copywriter: 编辑推荐：一阵阵和煦的风吹过焦躁的心, picUrl: https://p1.music.126.net/qVhr7ktZyBvN6Hf09xjaHA==/109951165896773939.jpg, canDislike: false, trackNumberUpdateTime: 1618502400000, playCount: 468111232, trackCount: 20, highQuality: false, alg: featured}
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
