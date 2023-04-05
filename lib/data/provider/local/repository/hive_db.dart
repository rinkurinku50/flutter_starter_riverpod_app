import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/data/provider/local/model/db_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class HiveDb {
  @factoryMethod
  static Future<HiveDb> init() async {
    await Hive.initFlutter();
    await Future.wait(<Future<Box<dynamic>>>[
      Hive.openBox(DbKeys.sessionTable),
      // Hive.openBox(DbKeys.baseTable),
    ]);
    CustomPrint.customPrint("hive db initialized");
    return HiveDb();
  }

  void write({required String box, required String key, required String value}) {
    Box table = Hive.box(box);
    table.put(key, value);
  }

  String read({required String box, required String key}) {
    Box table = Hive.box(box);
    return table.get(key, defaultValue: "");
  }

  void clear({required String box}) {
    Box table = Hive.box(box);
    table.clear();
  }
}
