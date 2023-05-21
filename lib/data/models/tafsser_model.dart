class TafsserModel {
  int? id;
  int? sura;
  int? aya;
  String? text;

  TafsserModel({this.id, this.sura, this.aya, this.text});

  TafsserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sura = json['sura'];
    aya = json['aya'];
    text = json['text'];
  }
}
