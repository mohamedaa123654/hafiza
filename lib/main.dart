import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await StorageHelper.getInstance();
  runApp( MyApp());
}
