import 'package:flutter/material.dart';
import 'package:movie_app/app_setup/dependency_injection.dart';
import 'package:movie_app/app_setup/hive/hive_setup.dart';
import 'package:movie_app/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const MyApp());
}

Future<void> initApp() async {
  initDependencyInjection();
  await HiveSetup.initHive();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
