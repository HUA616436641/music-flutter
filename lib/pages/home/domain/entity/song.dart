import 'package:cloud_music/pages/home/domain/entity/artist.dart';

import 'album.dart';

class Song {
  final int id;
  final String name;
  final String picUrl;
  final List<Artist> artistList;
  final Album album;
  Song({
    required this.id,
    required this.name,
    required this.picUrl,
    this.artistList = const [],
    required this.album,
  });
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
      artistList: (json['al'] as List).map((e) => Artist.fromJson(e)).toList(),
      album: Album.fromJson(json['al']),
    );
  }
}
