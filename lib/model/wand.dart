class Wand{
  final String wood;
  final String core;
  final String length;

  Wand(this.wood, this.core, this.length,);

  Wand.fromJson(Map<String, dynamic> json):
        wood = json['wood'],
        core = json['core'],
        length = json['length'].toString();
}