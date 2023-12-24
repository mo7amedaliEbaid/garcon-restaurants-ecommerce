import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // it won't work for some emulators.
  // change emulators or use physical device.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
