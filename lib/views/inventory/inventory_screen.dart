import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';
import 'package:shopify_admin_dashboard/views/inventory/controller/inventory_controller.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InventoryController invController = Get.put(InventoryController());
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
                  'Inventory',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                // CustomButton(
                //     title: 'Add Product',
                //     onTap: () {},
                //     icon: const Icon(
                //       Icons.add_circle_outline,
                //       color: AppTheme.whiteselClr,
                //       size: 18,
                //     )),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(height: 20),
            // Row(children: [
            //   Spacer(),
            // Obx(
            //   () => DropdownButtonHideUnderline(
            //     child: DropdownButton2<String>(
            //       dropdownStyleData: DropdownStyleData(
            //           decoration: BoxDecoration(
            //         color: AppTheme.secondaryClr,
            //         borderRadius: BorderRadius.circular(10),
            //       )),
            //       isExpanded: true,
            //       hint: Text(
            //         'Select Item',
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Theme.of(context).hintColor,
            //         ),
            //       ),
            //       items: invController.categories
            //           .map((String item) => DropdownMenuItem<String>(
            //                 value: item,
            //                 child: Text(
            //                   item,
            //                   style: const TextStyle(
            //                     fontSize: 14,
            //                     color: AppTheme.whiteselClr,
            //                   ),
            //                 ),
            //               ))
            //           .toList(),
            //       value: invController.seletedCategory.value,
            //       onChanged: (String? value) {
            //         if (value != null) {
            //           invController.seletedCategory.value = value!;
            //         } else {
            //           invController.seletedCategory.value = 'All';
            //         }
            //       },
            //       buttonStyleData: const ButtonStyleData(
            //         padding: EdgeInsets.symmetric(horizontal: 16),
            //         height: 40,
            //         width: 180,
            //       ),
            //       menuItemStyleData: const MenuItemStyleData(
            //         height: 40,
            //       ),
            //     ),
            //   ),
            // )
            // ]),
            const SizedBox(height: 10),
            //header preceeding the list name sku category price quantity status
            Container(
              color: AppTheme.secondaryClr,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'ID',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
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
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Vendor',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Price',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
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
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Status',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Reorder Level',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: invController.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: Get.height * 0.5,
                    child: Center(
                      child: LoadingIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: index.isEven
                              ? AppTheme.darkThemeBackgroudClr
                              : AppTheme.secondaryClr,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].productID.toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
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
                                    fontSize: Get.width * 0.008,
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
                                    fontSize: Get.width * 0.008,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Text(
                                  snapshot.data![index].category,
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].price.toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].quantityAvailable
                                      .toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Text(
                                  snapshot.data![index].productStatus,
                                  style: TextStyle(
                                    color:
                                        (snapshot.data![index].productStatus ==
                                                'Available')
                                            ? Colors.greenAccent
                                            : Colors.redAccent,
                                    fontSize: Get.width * 0.008,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].reorderLevel.toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
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
            )
          ],
        ),
      ),
    );
  }
}
