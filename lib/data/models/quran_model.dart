class QuranModel {
  String? name;
  String? englishName;
  int? number;
  int? start;
  int? numberVerses;
  int? numberWords;
  int? numberLetters;
  String? descent;
  int? pageNumber;

  QuranModel(
      {this.name,
      this.englishName,
      this.number,
      this.start,
      this.numberVerses,
      this.numberWords,
      this.numberLetters,
      this.descent,
      this.pageNumber});

  QuranModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    englishName = json['English_Name'];
    number = json['Number'];
    start = json['Start'];
    numberVerses = json['Number_Verses'];
    numberWords = json['Number_Words'];
    numberLetters = json['Number_Letters'];
    descent = json['Descent'];
    pageNumber = json['Page_Number'];
  }
}
