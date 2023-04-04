import 'package:hafiza/data/datasource/remote_datasource.dart';
import 'package:hafiza/data/models/pray_time_model.dart';
import 'package:hafiza/domain/repository/base_repository.dart';

class Repository implements BaseRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  
  @override
  Future<PrayTimeModel> getPrayTime(double lat, double long)async {
        return (await baseRemoteDataSource.getPrayTime(lat,long))!;

  }
}