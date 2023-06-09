import 'package:hive/hive.dart';

import '../data/cicis_adapter.dart';

class BoxRepository {
  static const String boxName = 'Cicis';

  static openBox() async => await Hive.openBox<Cicis>(boxName);

  static Box getBox() => Hive.box<Cicis>(boxName);

  static closeBox() async => await Hive.box(boxName).close();
}
