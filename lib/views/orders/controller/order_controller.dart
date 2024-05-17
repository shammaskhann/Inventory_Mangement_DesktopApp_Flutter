import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/graphmodels/PastWeekOrders.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  final List<String> timeSpan = [
    'Today',
    'Yesterday',
    'Last 7 days',
  ];
  RxString selectedTimeSpan = 'Today'.obs;

  @override
  void onInit() async {
    super.onInit();
    await ApiClient.getOrderAccToParam('Today');
  }

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

  Future getTodayOrders() async {
    final res = await ApiClient.getTodayOrdersCountInfoBlock();
    return res;
  }

  Future getPastWeekOrder() async {
    final res = await ApiClient.getTotalCountPastWeek();
    return res[0]['OrderCount'];
  }

  Future getGraphPastWeekOrders() async {
    List<PastWeekOrders> pastWeekOrders = [];
    final res = await ApiClient.getGraphPastWeekOrder();
    res.forEach((element) {
      DateTime orderDate = DateTime.parse(element['OrderDate']);
      String formattedDate = DateFormat('dd-MM-yyyy').format(orderDate);
      pastWeekOrders
          .add(PastWeekOrders(formattedDate, element['NumberOfOrders']));
    });
    return pastWeekOrders;
  }
}
