import 'package:flutter/material.dart';
import 'package:mobx_flutter/service/preference_service.dart';

import 'app_config.dart';
import 'main.dart';

void main() async {
  setupEnv(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}