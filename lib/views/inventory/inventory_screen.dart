import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
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
            Row(
              children: [
                const Text(
                  'Inventory',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                CustomButton(
                    title: 'Add Product',
                    onTap: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: AppTheme.whiteselClr,
                      size: 18,
                    )),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(children: [
              Spacer(),
              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                      color: AppTheme.secondaryClr,
                      borderRadius: BorderRadius.circular(10),
                    )),
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: invController.categories
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.whiteselClr,
                                ),
                              ),
                            ))
                        .toList(),
                    value: invController.seletedCategory.value,
                    onChanged: (String? value) {
                      if (value != null) {
                        invController.seletedCategory.value = value!;
                      } else {
                        invController.seletedCategory.value = 'All';
                      }
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 180,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 10),
            //header preceeding the list name sku category price quantity status
            Container(
              color: AppTheme.secondaryClr,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 65,
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Name',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'SKU',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Category',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Price',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Quantity',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Status',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Container(
                    color: index.isEven
                        ? AppTheme.darkThemeBackgroudClr
                        : AppTheme.secondaryClr,
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 65,
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'Product Name',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'SKU3092',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'Category321',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            '\$ 100.99',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            '12',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'Available',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
