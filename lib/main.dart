import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hiveapp/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveapp/localdb/details.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(
    DetailsAdapter(),
  );
  var box = await Hive.openBox<Details>('details');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
