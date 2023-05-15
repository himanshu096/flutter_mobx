import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  setupEnv(Environment.stag);
  runApp(const MyApp());
}