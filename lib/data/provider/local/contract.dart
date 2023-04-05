// @dart = 2.16
abstract class Database {
  Future<bool> spWrite({required String key, required String value});

  String spRead({required String key});

  Future<bool> spRemove({required String key});

  Future<bool> spClear();

  String dbRead({required String table, required String key});

  dbWrite({required String box, required String key, required String value});

  dbClear({required String table});
}
