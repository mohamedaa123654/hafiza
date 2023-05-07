class JuzaaModel {
  int? id;
  String? name;
  int? page;

  JuzaaModel({this.id, this.name, this.page});
  JuzaaModel.fromJson(Map<String, dynamic> json) {
    id = json['Number'];
    name = json['Name'];
    page = json['First_Page'];
  }
}