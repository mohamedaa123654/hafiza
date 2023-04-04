import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/data/datasource/remote_datasource.dart';
import 'package:hafiza/data/models/pray_time_model.dart';
import 'package:hafiza/data/repository/repository.dart';
import 'package:hafiza/domain/repository/base_repository.dart';
import 'package:hafiza/domain/usecases/getp_pray_time_usecase.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';
import 'package:intl/intl.dart';

class PrayerTimeController extends GetxController {
  final NetworkInfo networkInfo;
  PrayerTimeController(this.networkInfo);
  late RxBool hasPermission = false.obs;
  RxBool isConnected = false.obs;
  RxBool isDataLoaded = false.obs;
  final formatNumber = NumberFormat.decimalPattern('ar');

  @override
  void onInit() async {
    if (await networkInfo.isConnected) {
      getPrayTime(AppConstants.lat, AppConstants.long);

      isConnected.value = true;
    } else {
      isConnected.value = false;
    }

    super.onInit();
  }

  PrayTimeModel? prayTimeModel;
  // --------------------------------------------------Get Pray Time Data
  getPrayTime(latitude, longitude) async {
    try {
      BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
      BaseRepository baseRepository = Repository(baseRemoteDataSource);

      final model =
          await GetPrayTimeUseCase(baseRepository).execute(latitude, longitude);

      if (model != null) {
        prayTimeModel = model;
        calculateNextPrayerTime();
      }
    } catch (e) {
      print(e);
    }
  }

  DateTime now = DateTime.now();

  List<String>? nextPrayer;
  List<List<String>> allPrayers = [];
  List<String>? previousPrayer;
  DateTime? nextPrayerTime;
  DateTime? previousPrayerTime;
  double? counter;
  calculateNextPrayerTime() {
    List<List<String>> data = [
      [
        prayTimeModel!.data!.timings!.fajr!,
        'الفجر',
        '0',
        'assets/images/prayer/0.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.fajr!),
      ],
      [
        prayTimeModel!.data!.timings!.sunrise!,
        'الشروق',
        '1',
        'assets/images/prayer/1.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.sunrise!),
      ],
      [
        prayTimeModel!.data!.timings!.dhuhr!,
        'الظهر',
        '1',
        'assets/images/prayer/2.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.dhuhr!),
      ],
      [
        prayTimeModel!.data!.timings!.asr!,
        'العصر',
        '3',
        'assets/images/prayer/3.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.asr!),
      ],
      [
        prayTimeModel!.data!.timings!.maghrib!,
        'المغرب',
        '4',
        'assets/images/prayer/4.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.maghrib!),
      ],
      [
        prayTimeModel!.data!.timings!.isha!,
        'العشاء',
        '5',
        'assets/images/prayer/5.svg',
        convertTimeTo12HourFormat(prayTimeModel!.data!.timings!.isha!),
      ]
    ];
    allPrayers = data;
    for (List<String> prayer in data) {
      String dateString = DateFormat("yyyy-MM-dd").format(now);
      DateTime prayerTime =
          DateFormat("yyyy-MM-dd HH:mm").parse("$dateString ${prayer[0]}");
      // print(prayerTime);
      if (prayerTime.isAfter(now)) {
        nextPrayer = prayer;

        nextPrayerTime = prayerTime;
        previousPrayer = data[int.parse(nextPrayer![2]) - 1];
        previousPrayerTime = DateFormat("yyyy-MM-dd HH:mm")
            .parse("$dateString ${previousPrayer![0]}");
        isDataLoaded.value = true;
        isConnected.value = true;
        break;
      }
    }

    startCountdown();
  }

  String convertTimeTo12HourFormat(String time) {
    int hour = int.parse(time.substring(0, 2));
    int minute = int.parse(time.substring(3, 5));
    String meridiem;

    if (hour > 12) {
      hour -= 12;
      meridiem = 'م';
    } else if (hour == 12) {
      meridiem = 'م';
    } else if (hour == 0) {
      hour = 12;
      meridiem = 'ص';
    } else {
      meridiem = 'ص';
    }

    String hourString = hour.toString().padLeft(2, '0');
    String minuteString = minute.toString().padLeft(2, '0');
    return '$hourString:$minuteString $meridiem';
  }

  // late Duration countdownDuration;
  // late Timer timer;
  RxInt remainingSeconds = 0.obs;
  RxInt endTime = 0.obs;
  late Timer _timer;
  int timeBetweenPrayers = 0;
  RxDouble percentage = 0.0.obs;

  void startCountdown() {
    remainingSeconds.value = nextPrayerTime!.difference(now).inSeconds;
    timeBetweenPrayers =
        nextPrayerTime!.difference(previousPrayerTime!).inSeconds;
    endTime.value = nextPrayerTime!.millisecondsSinceEpoch + 1000 * 30;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        percentage.value = 1 - (remainingSeconds.value / timeBetweenPrayers);
        // print(percentage.value);
      } else {
        getPrayTime(AppConstants.lat, AppConstants.long);
        _timer.cancel();
      }
    });
  }
}
