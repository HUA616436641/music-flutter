import 'package:cloud_music/pages/home/domain/entity/banner.dart';

import '../domain/adapters/repository_adapter.dart';
import 'home_api_provider.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<List<SwiperBanner>> getBanner() async {
    final cases = await provider.getBanner();
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

  @override
  Future<List<SongList>> getSongList() async {
    final cases = await provider.getSongList();
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
