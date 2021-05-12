import 'package:cloud_music/pages/home/domain/entity/banner.dart';
import 'package:cloud_music/pages/home/domain/entity/song.dart';

import 'daily_recommond_provider.dart';

abstract class IDailyRecRepository {
  Future<List<Song>> getDailyRecSongs();
}

class DailyRecRepository implements IDailyRecRepository {
  DailyRecRepository({required this.provider});
  final IDailyRecProvider provider;

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
