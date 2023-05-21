import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafiza/data/datasource/local/cache_helper.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  runApp( MyApp());
}
