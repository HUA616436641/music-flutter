import 'package:cloud_music/pages/home/domain/entity/banner.dart';

abstract class IDailyRecRepository {
  Future<List<SongList>> getDailyRecSongs();
}

class DailyRecRepository implements IDailyRecRepository {
  DailyRecRepository({required this.provider});
  final IDailyRecRepository provider;

  @override
  Future<List<SongList>> getDailyRecSongs() async {
    return [];
  }
}
