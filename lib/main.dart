import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'core/inject/inject.dart';

Future<void> main() async {
  await Inject.init();
  runApp(const App());
}
