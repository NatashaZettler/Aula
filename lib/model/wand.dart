class Wand {
  final String idWand;
  final String wood;
  final String core;
  final String length;

  Wand(
    this.idWand,
    this.wood,
    this.core,
    this.length,
  );

  Wand.fromJson(Map<String, dynamic> json)
      : wood = json['wood'],
        core = json['core'],
        length = json['length'].toString(),
        idWand = '${json['wood']}-${json['core']}';

  bool isValid() => wood != "" && core != "" && length != "";
}
