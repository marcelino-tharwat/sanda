import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/networking/dio_factory.dart';
import 'package:sanda/sanda_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupGetIt();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const SandaApp());
}
