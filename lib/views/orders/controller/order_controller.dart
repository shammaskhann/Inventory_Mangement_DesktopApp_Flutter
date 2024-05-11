import 'package:get/get.dart';

class OrderController extends GetxController {
  final List<String> timeSpan = [
    'Today',
    'Yesterday',
    'Last 7 days',
    'Last 30 days',
  ];
  RxString selectedTimeSpan = 'Today'.obs;
  Future<List> getOrderList(String selTimeSpan) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      {
        'orderID': 1001,
        'CustomerName': 'John Doe',
        'Product': 'Laptop',
        'OrderDate': '2021-09-01',
        'Status': 'Delivered',
        'Channel': 'Online',
        'Total': 899.99
      },
      {
        'orderID': 1002,
        'CustomerName': 'Jane Doe',
        'Product': 'Mobile',
        'OrderDate': '2021-09-02',
        'Status': 'Pending',
        'Channel': 'Offline',
        'Total': 499.99
      },
      {
        'orderID': 1003,
        'CustomerName': 'John Doe',
        'Product': 'Tablet',
        'OrderDate': '2021-09-03',
        'Status': 'Delivered',
        'Channel': 'Online',
        'Total': 299.99
      },
      {
        'orderID': 1004,
        'CustomerName': 'Jane Doe',
        'Product': 'Laptop',
        'OrderDate': '2021-09-04',
        'Status': 'Pending',
        'Channel': 'Offline',
        'Total': 899.99
      },
    ];
  }
}
