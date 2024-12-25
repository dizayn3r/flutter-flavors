import 'package:flutter/material.dart';

import 'app_environment.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnvironment.setupEnv(Environment.staging);
  runApp(const MyApp());
}
