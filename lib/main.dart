import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/networking/dio_factory.dart';
import 'package:sanda/sanda_app.dart';

void main() {
  setupGetIt();
   HttpOverrides.global = MyHttpOverrides();
  runApp(const SandaApp());
}
