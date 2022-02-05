class WomenSC {
  String name;
  String imageUrl;

  WomenSC({required this.name, required this.imageUrl});

  // TODO Changes maybe needed

  factory WomenSC.fromJson(Map<String, dynamic> json) {
    return WomenSC(name: json['name'], imageUrl: json['imageUrl']);
  }
}
