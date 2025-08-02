import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/injection.dart';
import 'pair_up_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DependencyInjection.initializeInjection();
  runApp(const PairUpApp());
}
