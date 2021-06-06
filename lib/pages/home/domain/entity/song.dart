import 'package:cloud_music/pages/home/domain/entity/artist.dart';

import 'album.dart';

class Song {
  final int id;
  final String name;
  final String? url;
  final List<Artist> artistList;
  final Album album;

  String get artistName => artistList.map((e) => e.name).join('/');

  Song({
    required this.id,
    required this.name,
    this.url,
    this.artistList = const [],
    required this.album,
  });
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      artistList: (json['ar'] as List).map((e) => Artist.fromJson(e)).toList(),
      album: Album.fromJson(json['al']),
    );
  }
}
