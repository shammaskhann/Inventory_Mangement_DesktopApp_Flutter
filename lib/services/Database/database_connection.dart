import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/Api/ApiConstant.dart';
import 'package:http/http.dart' as http;

class DatabaseServices {
  // MssqlConnection mssqlConnection = MssqlConnection.getInstance();

  // Future<bool> connectDb() async {
  //   // Example: Connect to the database
  //   log('connecting');
  //   bool isConnected = await mssqlConnection.connect(
  //     ip: '192.168.18.127',
  //     // S
  //     port: '1433',
  //     databaseName: 'shopify_Clone',
  //     username: 'shammas',
  //     password: 'shammas0312',
  //     timeoutInSeconds: 15,
  //   );
  //   return isConnected;
  // }

  Future<bool> checkDbConnection() async {
    try {
      final Uri url =
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.checkDbConnection}');
      // final Uri url =
      //     Uri.parse('http://192.168.18.127:3000/api/db-connection-status');
      log('Checking Database Connection $url');

      final result = await http.get(url);
      log('Database Connection: ${result.body}');
      if (result.statusCode == 200) {
        Map<String, dynamic> response = jsonDecode(result.body);
        bool dbConnected = response['dbConnected'] as bool;
        return dbConnected;
      } else {
        log('Error: ${result.body}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}
