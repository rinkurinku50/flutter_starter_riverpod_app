import 'package:flutter_starter/data/provider/local/contract.dart';
import 'package:flutter_starter/data/provider/local/model/db_keys.dart';
import 'package:injectable/injectable.dart';

import 'contract.dart';

@Singleton(as: HeaderUtilsPI)
class HeaderUtilPIImplementation implements HeaderUtilsPI {
  final Database _database;

  HeaderUtilPIImplementation(this._database);

  @override
  String get language {
    return "English";
  }

  @override
  String get loginModule {
    String isRedirect = _database.dbRead(table: DbKeys.sessionTable, key: DbKeys.isRedirectLogin);
    if (isRedirect.isNotEmpty && isRedirect == true.toString()) {
      return "REDIRECT";
    } else {
      return "PWD";
    }
  }

  @override
  String get token => _database.dbRead(table: DbKeys.sessionTable, key: DbKeys.token);
}
