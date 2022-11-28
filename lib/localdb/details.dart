import 'package:hive/hive.dart';

part 'details.g.dart';

@HiveType(typeId: 0)
class Details {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  String phone;
  @HiveField(3)
  String address;

  Details({
    required this.name,
    required this.age,
    required this.phone,
    required this.address,
  });
}
