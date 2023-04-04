import 'package:hafiza/data/models/pray_time_model.dart';

abstract class BaseRepository {
  Future<PrayTimeModel> getPrayTime(double lat,double long);
}