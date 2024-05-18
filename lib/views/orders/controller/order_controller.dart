import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/graphmodels/PastWeekOrders.dart';
import 'package:shopify_admin_dashboard/data/models/orders/order_model.dart';
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
    final result = await ApiClient.getOrderAccToParam(selTimeSpan);
    // List<OrderView> orderList = [];
    // result.forEach((element) {
    //   orderList.add(OrderView.fromJson(element));
    // });
    return result;
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
