class AzkaryTitleModel {
  int? id;
  String? name;

  AzkaryTitleModel({this.id, this.name});

  AzkaryTitleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class AzkaryModel {
  int? id;
  String? category;
  int? count;
  String? description;
  String? reference;
  String? zekr;

  AzkaryModel(
      {this.id,
      this.category,
      this.count,
      this.description,
      this.reference,
      this.zekr});

  AzkaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    zekr = json['zekr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['count'] = this.count;
    data['description'] = this.description;
    data['reference'] = this.reference;
    data['zekr'] = this.zekr;
    return data;
  }
}
