import 'package:hafiza/data/models/pray_time_model.dart';
import 'package:hafiza/domain/repository/base_repository.dart';

class GetPrayTimeUseCase {
  final BaseRepository repository;

  GetPrayTimeUseCase(this.repository);

  Future<PrayTimeModel> execute(double lat,double long) async {
    return await repository.getPrayTime(lat,long);
  }
}