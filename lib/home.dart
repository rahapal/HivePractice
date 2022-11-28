import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveapp/localdb/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<Details> box;
  List<String> name = ['Jone', 'Doe', 'Smith'];
  List<int> age = [20, 21, 22];
  List<String> phone = ['1234567890', '0987654321', '1234567890'];
  List<String> address = ['USA', 'UK', 'India'];

  @override
  void initState() {
    super.initState();
    box = Hive.box<Details>('details');
    for (int i = 0; i < name.length; i++) {
      box.add(
        Details(
          name: name[i],
          age: age[i],
          address: address[i],
          phone: phone[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive practice'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final details = box.getAt(index);
          return ListTile(
            title: Text(details!.name),
            subtitle: Text(details.age.toString()),
            trailing: Text(details.phone),
          );
        },
      ),
    );
  }
}
