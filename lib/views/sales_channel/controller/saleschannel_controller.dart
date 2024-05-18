import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/saleschannel/salesChannel.dart';

import '../../../services/API/API_Client.dart';

class SalesChannelController extends GetxController {
  Future<List<SalesChannel>> getSalesChannel() async {
    final res = await ApiClient.getSalesChannel();
    List<SalesChannel> salesChannel = [];
    if (res != null) {
      for (var item in res) {
        salesChannel.add(SalesChannel.fromJson(item));
      }
    }
    return salesChannel;
  }
}
