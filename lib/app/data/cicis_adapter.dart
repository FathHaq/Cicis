import 'package:hive/hive.dart';

part 'cicis_adapter.g.dart';

@HiveType(typeId: 1)
class Cicis {
  Cicis({required this.title, required this.category, required this.nominal, required this.date});
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  int nominal;

  @HiveField(3)
  String date;


}
