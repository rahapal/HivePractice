import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ios/path_provider_ios.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Mandatory
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  var box = await Hive.openBox<String>('friends');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<String> box;
  final _idController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>('friends');
  }

  // @override
  // void dispose() {
  //   _idController.dispose();
  //   _nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive CRUD'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Show'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: const InputDecoration(
                                      label: Text('Key'),
                                    ),
                                    controller: _idController,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      label: Text('Value'),
                                    ),
                                    controller: _nameController,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final key = _idController.text;
                                      final value = _nameController.text;
                                      box.put(key, value);
                                      //print index of the key
                                      print(box.keyAt(int.parse(key)));
                                      //print primary key of the box
                                      print(box.keyAt(0));

                                      _idController.clear();
                                      _nameController.clear();

                                      Navigator.pop(context);
                                    },
                                    child: const Text('submit'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text('create'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('update'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
