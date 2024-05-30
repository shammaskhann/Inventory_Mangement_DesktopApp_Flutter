import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/shippers/controller/shipper_controller.dart';
import 'package:get/get.dart';
import '../../constant/theme/app_themes.dart';
import '../components/CustomButton.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ShipperScreen extends StatelessWidget {
  const ShipperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    {
      // {
      //   "OrderID": 31,
      //   "Name": "Emily Johnson",
      //   "Address": "123 Main St, Cityville, CA",
      //   "ShipperName": "Swift Logistics",
      //   "ShippingServices": "Standard",
      //   "ShippingRates": 5,
      //   "CurrentStatus": "In Transit",
      //   "EstimatedDeliveryDate": "2024-05-28T00:00:00.000Z"
      // }
      ShipperController shipperController = Get.put(ShipperController());
      return Container(
        color: AppTheme.darkThemeBackgroudClr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Logistics',
                style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              //create a header
              Row(children: [
                SizedBox(
                  width: Get.width * 0.1,
                  child: Text(
                    'Order ID',
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
                    'Reciever Name',
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
                    'Shipper Name',
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
                    'Shipping Services',
                    style: TextStyle(
                      color: AppTheme.whiteselClr,
                      fontSize: Get.width * 0.009,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                  child: Text(
                    'Shipping Rates',
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
                    'Current Status',
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
                    'Estimated Delivery Date',
                    style: TextStyle(
                      color: AppTheme.whiteselClr,
                      fontSize: Get.width * 0.009,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              GetBuilder(
                  init: shipperController,
                  builder: (controller) {
                    return Expanded(
                        child: FutureBuilder(
                            future: controller.getShippers(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(child: LoadingIndicator());
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      color: index.isEven
                                          ? AppTheme.secondaryClr
                                          : AppTheme.darkThemeBackgroudClr,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.1,
                                            child: Text(
                                              snapshot.data?[index].orderID
                                                      .toString() ??
                                                  '',
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
                                              snapshot.data?[index].name ?? '',
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
                                              snapshot.data?[index].address ??
                                                  '',
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
                                              snapshot.data?[index]
                                                      .shipperName ??
                                                  '',
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
                                              snapshot.data?[index]
                                                      .shippingServices ??
                                                  '',
                                              style: TextStyle(
                                                color: AppTheme.whiteselClr,
                                                fontSize: Get.width * 0.009,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.05,
                                            child: Text(
                                              snapshot.data?[index]
                                                      .shippingRates
                                                      .toString() ??
                                                  '',
                                              style: TextStyle(
                                                color: AppTheme.whiteselClr,
                                                fontSize: Get.width * 0.009,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.1,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  snapshot.data?[index]
                                                          .currentStatus ??
                                                      '',
                                                  style: TextStyle(
                                                    color: (snapshot
                                                                .data?[index]
                                                                .currentStatus ==
                                                            'Delivered')
                                                        ? Colors.greenAccent
                                                        : Colors.yellowAccent,
                                                    fontSize: Get.width * 0.009,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                (snapshot.data?[index]
                                                            .currentStatus !=
                                                        'Delivered')
                                                    ? IconButton(
                                                        icon: Icon(
                                                          Icons.edit,
                                                          size:
                                                              Get.width * 0.009,
                                                          color: AppTheme
                                                              .whiteselClr,
                                                        ),
                                                        onPressed: () {
                                                          updateTrackingStatusDailog(
                                                              controller,
                                                              snapshot
                                                                      .data?[
                                                                          index]
                                                                      .orderID ??
                                                                  0,
                                                              snapshot
                                                                      .data?[
                                                                          index]
                                                                      .currentStatus ??
                                                                  "");
                                                        },
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.1,
                                            child: Text(
                                              formatDate(snapshot.data?[index]
                                                      .estimatedDeliveryDate
                                                      .toString() ??
                                                  ''),
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
                            }));
                  }),
            ],
          ),
        ),
      );
    }
  }
}

String formatDate(String date) {
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formattedDate = formatter.format(parsedDate);
  return formattedDate;
}

updateTrackingStatusDailog(
    ShipperController controller, int orderID, String currentStatus) {
  Get.dialog(Dialog(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Container(
        width: Get.width * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Update Tracking Status',
              style: TextStyle(
                color: AppTheme.secondaryClr,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Colors.transparent,
                      value: controller.trackingStatus.value == ''
                          ? null
                          : controller.trackingStatus.value,
                      isExpanded: true,
                      hint: Text("${currentStatus}"),
                      items: [
                        'In Transit',
                        'Out for Delivery',
                        'Pending Pickup',
                        'Delivered'
                      ]
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          controller.trackingStatus.value = value;
                        }
                      },
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Obx(
              () => CustomButton(
                  loading: controller.loading.value,
                  title: 'Update',
                  onTap: () async {
                    await controller.updateTrackingStatus(orderID);
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.update_rounded,
                    color: AppTheme.whiteselClr,
                  )),
            )
          ],
        ),
      ),
    ),
  ));
}
