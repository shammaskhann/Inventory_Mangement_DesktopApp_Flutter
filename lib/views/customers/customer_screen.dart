import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/data/models/orders/customer_model.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/customers/controller/customer_controller.dart';

import '../../constant/theme/app_themes.dart';
import '../components/tag_container.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomersController customersController = Get.put(CustomersController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customers',
              style: TextStyle(
                color: AppTheme.whiteselClr,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                CustomTagContainer(
                  iconData: Icons.list,
                  text: 'Customers List',
                ),
                SizedBox(width: 10),
                CustomTagContainer(
                  iconData: Icons.history,
                  text: 'History',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //Headers
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: Get.width * 0.8,
              color: AppTheme.secondaryClr,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'CustomerID',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Customer Name',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.13,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.13,
                    child: Text(
                      'Address',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Amount Spent',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

//Customer Data
            FutureBuilder(
              future: customersController.getCustomers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: Get.height * 0.6,
                    width: Get.width * 0.8,
                    child: const Center(
                      child: LoadingIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Customer customer = snapshot.data![index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: Get.width * 0.8,
                        color: index.isEven
                            ? AppTheme.darkThemeBackgroudClr
                            : AppTheme.secondaryClr,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.07,
                              child: Text(
                                '${customer.customerId}',
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                              child: Text(
                                customer.name,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                              child: Text(
                                customer.phoneNumber,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.13,
                              child: Text(
                                customer.email,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.13,
                              child: Text(
                                customer.address,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                              child: Text(
                                (customer.totalAmountSpent != null)
                                    ? '\$${customer.totalAmountSpent}'
                                    : 'N/A',
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.009,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
