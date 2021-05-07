import 'package:cloud_music/pages/home/domain/entity/banner.dart';

import 'daily_recommond_provider.dart';

abstract class IDailyRecRepository {
  Future<List<SongList>> getDailyRecSongs();
}

class DailyRecRepository implements IDailyRecRepository {
  DailyRecRepository({required this.provider});
  final IDailyRecProvider provider;

  @override
  Future<List<SongList>> getDailyRecSongs() async {
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
