import 'package:tuple/tuple.dart';

class Lyric {
  final String? lrcStr;
  final List<Tuple2<Duration, String>> lrcItems;
  Lyric({required this.lrcStr})
      : lrcItems = (lrcStr ?? '').split('\n').map((e) {
          final reg = RegExp(r'\[(\d{2}):(\d{2}).(\d{2,3})]');
          if (reg.hasMatch(e)) {
            final res = reg.firstMatch(e);
            final duration = Duration(
              minutes: int.parse(res!.group(1)!),
              seconds: int.parse(res.group(2)!),
              milliseconds: int.parse(res.group(3)!),
            );
            return Tuple2(duration, e.substring(res.end));
          }
          return Tuple2(Duration(), '');
        }).toList();
}
