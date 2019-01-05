class Photo {
  final int id;
  final String title;
  final String image;

  Photo({this.id, this.title, this.image});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      image: json['thumbnailUrl']
    );
  }

  String toStringId() {
    return id.toString();
  }
}