import 'player_provider.dart';

abstract class IPlayerRepository {
  Future<List<String>> getSongUrls(List<int> songIds);
}

class PlayerRepository implements IPlayerRepository {
  PlayerRepository({required this.provider});
  final IPlayerProvider provider;

  @override
  Future<List<String>> getSongUrls(List<int> songIds) async {
    try {
      final cases = await provider.getSongUrls(songIds);
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
