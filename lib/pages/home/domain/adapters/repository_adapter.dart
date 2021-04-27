// ignore: one_member_abstracts
import 'package:cloud_music/pages/home/domain/entity/banner.dart';

abstract class IHomeRepository {
  Future<List<SwiperBanner>> getBanner();
  Future<List<SongList>> getSongList();
}
