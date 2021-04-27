// banner
class SwiperBanner {
  final String id;
  final String url;
  SwiperBanner({required this.id, required this.url});
}

class SongList {
  final int id;
  final String name;
  final String picUrl;
  final int trackCount;
  final int playCount;
  SongList({
    required this.id,
    this.name = '',
    this.picUrl = '',
    this.trackCount = 0,
    this.playCount = 0,
  });
  factory SongList.fromJson(Map<String, dynamic> json) {
    return SongList(
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
      trackCount: json['trackCount'],
      playCount: json['playCount'],
    );
  }
}
