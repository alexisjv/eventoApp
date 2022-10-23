class Evento {
  int id;
  String name;
  String coverImage;

  Evento({
    required this.id,
    required this.name,
    required this.coverImage,
  });

  Evento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coverImage = json['coverImage'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coverImage': coverImage,
      };
}
