import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/orders/customer_model.dart';
import 'package:shopify_admin_dashboard/services/API/API_Client.dart';

class CustomersController extends GetxController {
  Future<List<Customer>> getCustomers() async {
    List<Customer> customers = [];
    final res = await ApiClient.getCustomers();
    if (res != null) {
      for (var item in res) {
        customers.add(Customer.fromJson(item));
      }
    }
    return customers;
  }
}
