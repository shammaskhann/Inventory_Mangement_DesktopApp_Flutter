import 'dart:developer';

import 'package:mssql_connection/mssql_connection.dart';

class DatabaseServices {
  MssqlConnection mssqlConnection = MssqlConnection.getInstance();

  Future<bool> connectDb() async {
    // Example: Connect to the database
    log('connecting');
    bool isConnected = await mssqlConnection.connect(
      ip: '192.168.18.127',
      // S
      port: '1433',
      databaseName: 'shopify_Clone',
      username: 'shammas',
      password: 'shammas0312',
      timeoutInSeconds: 15,
    );
    return isConnected;
  }
}
