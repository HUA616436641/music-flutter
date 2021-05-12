class Artist {
  final String id;
  final String name;
  Artist({required this.id, required this.name});
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> toJson() {
    return {id: id, name: name};
  }
}
