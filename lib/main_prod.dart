import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  setupEnv(Environment.prod);
  runApp(const MyApp());
}