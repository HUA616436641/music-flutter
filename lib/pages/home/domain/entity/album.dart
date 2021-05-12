import 'package:cloud_music/pages/home/domain/entity/artist.dart';

class Album {
  final int id;
  final String name;
  final String picUrl;
  Album({
    required this.id,
    required this.name,
    required this.picUrl,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
    );
  }
}
