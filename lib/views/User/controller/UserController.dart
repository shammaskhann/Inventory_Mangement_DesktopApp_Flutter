import 'package:get/get.dart';

class UserController extends GetxController {
  late String userName;
  late String email;
  late String password;
  late String phoneNum;
  late String address;
  //productID,Quantity
  UserController(
      {required this.userName,
      required this.email,
      required this.password,
      required this.phoneNum,
      required this.address});

  RxList<RxMap<String, int>> cart = <RxMap<String, int>>[].obs;
}
