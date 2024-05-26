import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';
import 'package:shopify_admin_dashboard/views/vendors/controller/supplier_controller.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SupplierController supplierController = Get.put(SupplierController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Suppliers',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // CustomButton(
                //   title: 'ADD Supplier',
                //   onTap: () {},
                //   icon: const SizedBox(),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            //header preceeding the list name sku category price quantity status
            Container(
              color: AppTheme.secondaryClr,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Supplier ID',
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
                      'Supplier Name',
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
                      'Contact',
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
                    width: Get.width * 0.1,
                    child: Text(
                      'Phone',
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
                      'Payment Terms',
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
            //list of suppliers
            FutureBuilder(
              future: supplierController.getSuppliers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: Get.height * 0.5,
                      child: const Center(child: LoadingIndicator()));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: index.isEven
                              ? AppTheme.darkThemeBackgroudClr
                              : AppTheme.secondaryClr,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].supplierID.toString(),
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
                                width: Get.width * 0.1,
                                child: Text(
                                  snapshot.data![index].contactPerson,
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
                                  snapshot.data![index].contactEmail,
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
                                  snapshot.data![index].contactPhone,
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
                                  snapshot.data![index].address,
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
                                  snapshot.data![index].paymentTerms,
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
                    ),
                  );
                }
              },
            ),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         color: index.isEven
            //             ? AppTheme.darkThemeBackgroudClr
            //             : AppTheme.secondaryClr,
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 10, vertical: 15),
            //         child: Row(
            //           children: [
            //             const SizedBox(
            //               width: 65,
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Supplier Name',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Contact',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Email',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Phone',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Address',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Get.width * 0.1,
            //               child: const Text(
            //                 'Status',
            //                 style: TextStyle(
            //                   color: AppTheme.whiteselClr,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
