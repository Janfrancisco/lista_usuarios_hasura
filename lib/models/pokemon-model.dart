class Pokemon {
  final String name;
  final String url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], url: json['url']);
  }

  static List<Pokemon> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Pokemon.fromJson(item)).toList();
  }

  static List<Pokemon> fromJsonList2(List list) {
    if (list == null) return null;
    return list.map((item) {
      //print('poke');
      //print(item);
      return Pokemon.fromJson(item);
    }).toList();
  }
}
