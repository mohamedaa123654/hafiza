import 'package:dio/dio.dart';
import 'package:hafiza/app/api_constance.dart';
import 'package:hafiza/data/models/pray_time_model.dart';

abstract class BaseRemoteDataSource {
  Future<PrayTimeModel?> getPrayTime(double lat, double long);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<PrayTimeModel?> getPrayTime(double lat, double long) async {
    try {
      var response = await Dio().get(
          '${ApiConstants.baseUrl}${ApiConstants.gettime}latitude=$lat&longitude=$long');
      
      return PrayTimeModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}