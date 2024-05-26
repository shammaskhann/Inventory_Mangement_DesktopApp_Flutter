import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';
import 'package:shopify_admin_dashboard/views/purchase%20order/controller/purchaseorder_controller.dart';
import 'package:intl/intl.dart';

class PurchaseOrderScreen extends StatelessWidget {
  const PurchaseOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PurchaseOrderController purchaseOrderController =
        Get.put(PurchaseOrderController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Purchase Orders',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            //header preceeding the list name sku category price quantity status
            Container(
              color: AppTheme.secondaryClr,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'SKU (CODE)',
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
                      'Product Name',
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
                      'Vendor-Name',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Cost',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Status',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //invoice
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Expected Delivery Date',
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
            const SizedBox(height: 20),
            //list of purchase orders
            FutureBuilder(
                future: purchaseOrderController.getPurchaseOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            color: index.isEven
                                ? AppTheme.darkThemeBackgroudClr
                                : AppTheme.secondaryClr,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.07,
                                  child: Text(
                                    snapshot.data![index].purchaseOrderID
                                        .toString(),
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
                                    snapshot.data![index].product,
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
                                    snapshot.data![index].supplierName,
                                    style: TextStyle(
                                      color: AppTheme.whiteselClr,
                                      fontSize: Get.width * 0.009,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.07,
                                  child: Text(
                                    snapshot.data![index].orderedQuantity
                                        .toString(),
                                    style: TextStyle(
                                      color: AppTheme.whiteselClr,
                                      fontSize: Get.width * 0.009,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.07,
                                  child: Text(
                                      snapshot.data![index].totalCost
                                          .toString(),
                                      style: TextStyle(
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.009,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: Get.width * 0.07,
                                  child: Text(
                                    snapshot.data![index].status ?? "NULL",
                                    style: TextStyle(
                                      color: (snapshot.data![index].status ==
                                              'Pending')
                                          ? Colors.yellowAccent
                                          : Colors.greenAccent,
                                      fontSize: Get.width * 0.009,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.1,
                                  child: Text(
                                    formatDate(
                                      snapshot.data![index].expectedArrivalDate
                                          .toString(),
                                    ),
                                    style: TextStyle(
                                      color: AppTheme.whiteselClr,
                                      fontSize: Get.width * 0.009,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    showInvoiceDailog(purchaseOrderController,
                                        snapshot.data![index].purchaseOrderID);
                                  },
                                  child: Text(
                                    'View Invoice',
                                    style: TextStyle(
                                      color: AppTheme.grasGreenClr,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppTheme.grasGreenClr,
                                      fontSize: Get.width * 0.009,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

String formatDate(String date) {
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formattedDate = formatter.format(parsedDate);
  return formattedDate;
}

void showInvoiceDailog(PurchaseOrderController controller, int id) async {
  Get.dialog(
    Dialog(
      elevation: 1,
      backgroundColor: AppTheme.whiteselClr,
      child: Container(
        height: Get.height * 0.6,
        width: Get.width * 0.3,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invoice Details',
              style: TextStyle(
                color: AppTheme.darkThemeBackgroudClr,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: controller.getIvoiceDetail(id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInvoiceDetail(
                          title: 'Invoice ID:',
                          value: '${snapshot.data[0]['InvoiceID']}',
                        ),
                        _buildInvoiceDetail(
                          title: 'Supplier Name:',
                          value: '${snapshot.data[0]['SupplierName']}',
                        ),
                        _buildInvoiceDetail(
                          title: 'Total Cost:',
                          value: '\$${snapshot.data[0]['TotalCost']}',
                        ),
                        _buildInvoiceDetail(
                          title: 'Payment Status:',
                          value: '${snapshot.data[0]['PaymentStatus']}',
                        ),
                        _buildInvoiceDetail(
                          title: 'Date of Issue:',
                          value: formatDate(snapshot.data[0]['DateOfIssue']),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                icon: const SizedBox(),
                onTap: () {
                  Get.back();
                },
                title: 'Close',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildInvoiceDetail({String? title, String? value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title ?? '',
        style: const TextStyle(
          color: AppTheme.darkThemeBackgroudClr,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        value ?? '',
        style: const TextStyle(
          color: AppTheme.darkThemeBackgroudClr,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
