// @dart = 2.16
import 'package:injectable/injectable.dart';

import '../contract.dart';
import 'hive_db.dart';
import 'shared_preference.dart';

@Singleton(as: Database)
class DatabaseHelper implements Database {
  final SharedPrefs _sharedPrefs;
  final HiveDb _hiveDb;

  DatabaseHelper(this._sharedPrefs, this._hiveDb);

  @override
  Future<bool> spClear() {
    return _sharedPrefs.clear();
  }

  @override
  String spRead({required String key}) {
    return _sharedPrefs.read(key: key);
  }

  @override
  Future<bool> spRemove({required String key}) {
    return _sharedPrefs.remove(key: key);
  }

  @override
  Future<bool> spWrite({required String key, required String value}) {
    return _sharedPrefs.write(key: key, value: value);
  }

  @override
  dbClear({required String table}) {
    _hiveDb.clear(box: table);
  }

  @override
  String dbRead({required String table, required String key}) {
    return _hiveDb.read(box: table, key: key);
  }

  @override
  dbWrite({required String box, required String key, required String value}) {
    _hiveDb.write(box: box, key: key, value: value);
  }
}
