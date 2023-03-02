class PrayerTimesModel {
  Timings? timings;
  String? readable;
  String? hijriDate;

  String? timezone;

  PrayerTimesModel(
      {this.timings, this.readable, this.hijriDate, this.timezone});

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimesModel(
        timings: json['data']['timings'] != null
            ? new Timings.fromJson(json['data']['timings'])
            : null,
        readable: json['data']['date']['readable'],
        hijriDate: json['data']['date']['hijri']['date'],
        timezone: json['data']['meta']['timezone'],
      );
}

class Timings {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Timings({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}

class Timing {
  final int id;
  final String prayer;
  final String time;
  bool isTime;
  Timing(this.id,this.prayer, this.time, this.isTime);
}
