import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';

class PurchaseOrderScreen extends StatelessWidget {
  const PurchaseOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Purchase Orders',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: 'ADD Purchase-Order',
                  onTap: () {},
                  icon: const SizedBox(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //header preceeding the list name sku category price quantity status
            Container(
              color: AppTheme.secondaryClr,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'SKU (CODE)',
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
                      'Vendor-Name',
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
                      'Price',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //invoice
                  SizedBox(
                    width: Get.width * 0.1,
                    child: const Text(
                      'Invoice',
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
            //list of purchase orders
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    color: index.isEven
                        ? AppTheme.darkThemeBackgroudClr
                        : AppTheme.secondaryClr,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'SKU (CODE)',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: const Text(
                            'Vendor-Name',
                            style: TextStyle(
                              color: AppTheme.whiteselClr,
                              fontSize: 16,
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
                            ),
                          ),
                        ),
                        //invoice
                        SizedBox(
                          width: Get.width * 0.1,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'View Invoice',
                              style: TextStyle(
                                  color: AppTheme.grasGreenClr,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.grasGreenClr),
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
