import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/custommer_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/giftcard_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/product_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/salechannel_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/shipper_dropdown.dart';
import 'package:shopify_admin_dashboard/views/components/customDailogDetail.dart';
import 'package:shopify_admin_dashboard/views/components/dailogDetail.dart';
import 'package:shopify_admin_dashboard/views/orders/components/customer_wdiget.dart';
import 'package:shopify_admin_dashboard/views/orders/components/orderlist_header.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/models/dropdowns/discount_dropdown.dart';
import '../../data/models/graphmodels/PastWeekOrders.dart';
import '../../shared/loading_indicator.dart';
import '../components/CustomButton.dart';
import '../components/info_blocks2.dart';
import '../components/tag_container.dart';
import 'controller/order_controller.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final text16Font = width * 0.008;

    final OrderController orderController = Get.put(OrderController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      width: Get.width * 0.88,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30, top: 30),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orders',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CustomTagContainer(
                          iconData: Icons.list,
                          text: 'Orders',
                        ),
                        SizedBox(width: 10),
                        CustomTagContainer(
                          iconData: Icons.bar_chart,
                          text: 'Past Weeks Analysis',
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                CustomButton(
                  title: "Create Order",
                  icon: const Icon(
                    Icons.list_alt_sharp,
                    color: AppTheme.whiteselClr,
                    size: 17,
                  ),
                  onTap: () {
                    if (orderController.orderLoading == false) {
                      showAddOrderDialog(context, orderController);
                    } else {
                      Get.snackbar(
                          'Loading', 'Please wait for dropdowns to load',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.redAccent);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.4,
              // width: Get.width * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.secondaryClr,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      FutureBuilder(
                          future: orderController.getTodayOrders(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer(
                                gradient: AppTheme.shimmerEffectTile,
                                child: const InfoBlock2(
                                  title: 'Today Orders',
                                  value: 16,
                                  isGreaterThanLastWeek: true,
                                  percValue: 7,
                                ),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return InfoBlock2(
                                  title: "Today's Orders",
                                  value: snapshot.data?[0]
                                      ['NumberOfOrdersToday'],
                                  isGreaterThanLastWeek: !snapshot.data?[0]
                                      ['IsLesser'],
                                  percValue: double.parse(snapshot.data![0]
                                          ['PercentageChange']
                                      .toString()),
                                );
                              } else if (snapshot.hasError) {
                                return const InfoBlock2(
                                  title: "Today's Orders",
                                  value: 0,
                                  isGreaterThanLastWeek: false,
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }
                          }),
                      const SizedBox(width: 10),
                      FutureBuilder(
                          future: orderController.getPastWeekOrder(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer(
                                gradient: AppTheme.shimmerEffectTile,
                                child: const InfoBlock2(
                                  title: 'Past Week Orders',
                                  value: 16,
                                  isGreaterThanLastWeek: true,
                                  percValue: 7,
                                ),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return InfoBlock2(
                                  title: "Past Week Orders",
                                  value: snapshot.data,
                                  isGreaterThanLastWeek: false,
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }
                          }),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  // ignore: sized_box_for_whitespace
                  FutureBuilder(
                      future: orderController.getGraphPastWeekOrders(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: Get.height * 0.2,
                            child: Center(child: LoadingIndicator()),
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            height: Get.height * 0.25,
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              primaryXAxis: const CategoryAxis(
                                isVisible: true,
                                majorGridLines: MajorGridLines(width: 0),
                                axisLine: AxisLine(color: AppTheme.whiteselClr),
                                labelStyle:
                                    TextStyle(color: AppTheme.whiteselClr),
                              ),
                              primaryYAxis: const NumericAxis(
                                isVisible: true,
                                majorGridLines: MajorGridLines(width: 0.5),
                                minorGridLines: MinorGridLines(width: 0),
                                axisLine: AxisLine(color: AppTheme.whiteselClr),
                                labelStyle:
                                    TextStyle(color: AppTheme.whiteselClr),
                              ),
                              series: <CartesianSeries<PastWeekOrders, String>>[
                                SplineSeries<PastWeekOrders, String>(
                                  dataLabelSettings: const DataLabelSettings(
                                      textStyle: TextStyle(
                                          color: AppTheme.whiteselClr,
                                          fontWeight: FontWeight.bold),
                                      isVisible: true),
                                  animationDelay: 10,
                                  splineType: SplineType.monotonic,
                                  color: AppTheme.grasGreenClr,
                                  dataSource: [
                                    PastWeekOrders('Mon', 0),
                                    PastWeekOrders('Tue', 0),
                                    PastWeekOrders('Wed', 0),
                                    PastWeekOrders('Thu', 0),
                                    PastWeekOrders('Fri', 0),
                                    PastWeekOrders('Sat', 0),
                                    PastWeekOrders('Sun', 0),
                                  ],
                                  xValueMapper: (PastWeekOrders orders, _) =>
                                      orders.day,
                                  yValueMapper: (PastWeekOrders orders, _) =>
                                      orders.orders,
                                ),
                                // SplineSeries<SiteVisit, String>(
                                //   splineType: SplineType.cardinal,
                                //   color: AppTheme.grasGreenClr,
                                //   dataSource: data,
                                //   xValueMapper: (SiteVisit orders, _) =>
                                //       orders.time,
                                //   yValueMapper: (SiteVisit orders, _) =>
                                //       orders.visit,
                                // )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            height: Get.height * 0.25,
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              primaryXAxis: const CategoryAxis(
                                isVisible: true,
                                majorGridLines: MajorGridLines(width: 0),
                                axisLine: AxisLine(color: AppTheme.whiteselClr),
                                labelStyle:
                                    TextStyle(color: AppTheme.whiteselClr),
                              ),
                              primaryYAxis: const NumericAxis(
                                isVisible: true,
                                majorGridLines: MajorGridLines(width: 0.5),
                                minorGridLines: MinorGridLines(width: 0),
                                axisLine: AxisLine(color: AppTheme.whiteselClr),
                                labelStyle:
                                    TextStyle(color: AppTheme.whiteselClr),
                              ),
                              series: <CartesianSeries<PastWeekOrders, String>>[
                                SplineSeries<PastWeekOrders, String>(
                                  dataLabelSettings: const DataLabelSettings(
                                      textStyle: TextStyle(
                                          color: AppTheme.whiteselClr,
                                          fontWeight: FontWeight.bold),
                                      isVisible: true),
                                  animationDelay: 10,
                                  splineType: SplineType.monotonic,
                                  color: AppTheme.grasGreenClr,
                                  dataSource: snapshot.data,
                                  xValueMapper: (PastWeekOrders orders, _) =>
                                      orders.day,
                                  yValueMapper: (PastWeekOrders orders, _) =>
                                      orders.orders,
                                ),
                                // SplineSeries<SiteVisit, String>(
                                //   splineType: SplineType.cardinal,
                                //   color: AppTheme.grasGreenClr,
                                //   dataSource: data,
                                //   xValueMapper: (SiteVisit orders, _) =>
                                //       orders.time,
                                //   yValueMapper: (SiteVisit orders, _) =>
                                //       orders.visit,
                                // )
                              ],
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(color: AppTheme.secondaryClr),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
                child: Row(children: [
                  Text(
                    '   Recent Orders',
                    style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.012,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
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
                            fontSize: Get.width * 0.012,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: orderController.timeSpan
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
                        value: orderController.selectedTimeSpan.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            orderController.selectedTimeSpan.value = value!;
                          } else {
                            orderController.selectedTimeSpan.value = 'Today';
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const OrderListHeader(),
            Obx(
              () => FutureBuilder(
                future: orderController
                    .getOrderList(orderController.selectedTimeSpan.value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        height: Get.height * 0.2,
                        child: Center(child: LoadingIndicator()));
                  } else {
                    return GetBuilder<OrderController>(
                        init: orderController,
                        builder: (controller) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final status = snapshot.data?[index]
                                      ['FulfillmentStatus'] ??
                                  'N/A';
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: FocusedMenuHolder(
                                  openWithTap: true,
                                  menuOffset: 10,
                                  bottomOffsetHeight: 100,
                                  menuWidth: Get.width * 0.15,
                                  animateMenuItems: true,
                                  menuBoxDecoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  duration: const Duration(milliseconds: 100),
                                  menuItems: <FocusedMenuItem>[
                                    FocusedMenuItem(
                                      title: const Text('View Payment Status'),
                                      onPressed: () {
                                        paymentDetailDailog(orderController,
                                            snapshot.data?[index]['OrderID']);
                                      },
                                      trailingIcon: const Icon(Icons.payment),
                                    ),
                                    FocusedMenuItem(
                                      title: const Text('View Delivery Status'),
                                      onPressed: () {
                                        deliveryDetailDailog(orderController,
                                            snapshot.data?[index]['OrderID']);
                                      },
                                      trailingIcon:
                                          const Icon(Icons.local_shipping),
                                    ),
                                  ],
                                  onPressed: () {},
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppTheme.secondaryClr),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                snapshot.data?[index]['OrderID']
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.07,
                                              child: Text(
                                                snapshot.data?[index]
                                                            ['Customer']
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.11,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    snapshot.data?[index]
                                                                ['Product']
                                                            .toString() ??
                                                        'N/A',
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .whiteselClr,
                                                        fontSize: text16Font,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    ' x${snapshot.data?[index]['quantity'].toString() ?? 'N/A'}',
                                                    style: TextStyle(
                                                        color: Colors.grey[400],
                                                        fontSize: text16Font,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                formatDate(snapshot.data?[index]
                                                        ['OrderDate']) ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.07,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: (status ==
                                                        'Processing')
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    status,
                                                    style: TextStyle(
                                                        color: (status ==
                                                                'Processing')
                                                            ? Colors
                                                                .yellowAccent
                                                            : (status ==
                                                                    'Shipped')
                                                                ? Colors
                                                                    .greenAccent
                                                                : Colors
                                                                    .redAccent,
                                                        fontSize: text16Font,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.center,
                                                  ),

                                                  //button for fulfillment
                                                  if (status == 'Processing')
                                                    IconButton(
                                                      onPressed: () async {
                                                        log('update fullfilmentOrder ID: ${snapshot.data?[index]['OrderID']}');

                                                        await controller
                                                            .updateFulfillmentStatus(
                                                                snapshot.data?[
                                                                        index][
                                                                    'OrderID']);

                                                        controller
                                                            .update(); // Add this line
                                                      },
                                                      icon: const Icon(
                                                        Icons.archive,
                                                        color:
                                                            Colors.yellowAccent,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.1,
                                              child: Text(
                                                snapshot.data?[index]
                                                            ['ChannelName']
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                snapshot.data?[index]
                                                        ['DiscountCode'] ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                (snapshot.data?[index]
                                                                ['GiftCard']
                                                            .toString() ==
                                                        'null')
                                                    ? 'N/A'
                                                    : snapshot.data![index]
                                                            ['GiftCard']
                                                        .toString(),
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                "\$${snapshot.data?[index]['Subtotal'].toString() ?? 'N/A'}",
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                "\$${"\$${snapshot.data?[index]['DiscountAmount'].toString() ?? 'N/A'}"}",
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                "\$${snapshot.data?[index]['Shipping'].toString() ?? 'N/A'}",
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                "\$${snapshot.data?[index]['Total'].toString() ?? 'N/A'}",
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                              child: Text(
                                                snapshot.data?[index]
                                                            ['PaymentStatus']
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                    color: (snapshot
                                                                .data?[index][
                                                                    'PaymentStatus']
                                                                .toString() ==
                                                            'Paid')
                                                        ? Colors.greenAccent
                                                        : Colors.yellowAccent,
                                                    fontSize: text16Font,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                //delete confirmation dailog
                                                Get.defaultDialog(
                                                  title: 'Delete Order',
                                                  middleText:
                                                      'Are you sure you want to delete this order?',
                                                  textConfirm: 'Yes',
                                                  textCancel: 'No',
                                                  confirmTextColor:
                                                      Colors.white,
                                                  buttonColor: Colors.redAccent,
                                                  cancelTextColor: Colors.black,
                                                  onConfirm: () async {
                                                    await controller
                                                        .deleteOrder(snapshot
                                                                .data?[index]
                                                            ['OrderID']);
                                                    controller.update();
                                                    Get.back();
                                                  },
                                                  onCancel: () {
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                              ),
                                            )
                                          ],
                                        )),

                                    // child: CustomerWidget(
                                    //   orderId: snapshot.data?[index]
                                    //           ['OrderID'] ??
                                    //       'N/A',
                                    //   customer: snapshot.data?[index]
                                    //           ['Customer'] ??
                                    //       'N/A',
                                    //   product: snapshot.data?[index]
                                    //           ['Product'] ??
                                    //       'N/A',
                                    //   date: formatDate(snapshot.data?[index]
                                    //           ['OrderDate']) ??
                                    //       'N/A',
                                    //   status: snapshot.data?[index]
                                    //           ['FulfillmentStatus'] ??
                                    //       'N/A',
                                    //   channel: snapshot.data?[index]
                                    //           ['ChannelName'] ??
                                    //       'N/A',
                                    //   total: snapshot.data?[index]['Total']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   subTotal: snapshot.data?[index]
                                    //               ['Subtotal']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   shipping: snapshot.data?[index]
                                    //               ['Shipping']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   discountAmount: snapshot.data?[index]
                                    //               ['DiscountAmount']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   giftCard: snapshot.data?[index]
                                    //               ['GiftCard']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   disountCode: snapshot.data?[index]
                                    //           ['DiscountCode'] ??
                                    //       'N/A',
                                    //   paymentStatus: snapshot.data![index]
                                    //       ['PaymentStatus'],
                                    //   quantity: snapshot.data?[index]
                                    //               ['quantity']
                                    //           .toString() ??
                                    //       'N/A',
                                    //   controller: orderController,
                                    // ),
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAddOrderDialog(BuildContext context, OrderController controller) {
    Get.dialog(
      Dialog(
        elevation: 1,
        backgroundColor: Colors.white,
        child: Container(
          width: Get.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Add Order',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  //Select Customer DropDown through Name and save the id in controller rxint selectedCustomerID

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

                            value: controller.selectedCustomerID.value == 0
                                ? null
                                : controller.selectedCustomerID.value
                                    .toString(), //
                            //     controller.selectedCustomerID.value.toString() ?? null,
                            isExpanded: true,
                            hint: const Text('Select Customer'),
                            items: controller.customerDropDown
                                .map((CustomerDropDown item) =>
                                    DropdownMenuItem<String>(
                                      value: item.customerID.toString(),
                                      child: Text(item.name.toString()),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                // log('Selected Customer ID: $value');
                                controller.selectedCustomerID.value =
                                    int.parse(value);
                              }
                            },
                          ),
                        ),
                      )),

                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: controller.orderDateController,
                    decoration: const InputDecoration(
                      labelText: 'Order Date',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the order date';
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      if (picked != null) {
                        if (picked.isAfter(DateTime.now())) {
                          //dont pick the date
                          Get.snackbar(
                              'Error', 'Order date cannot be in the future',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.redAccent);
                        } else {
                          controller.orderDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      }
                      ;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

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
                            value: controller.selectedDiscountID.value == ''
                                ? null
                                : controller.selectedDiscountID.value
                                    .toString(),
                            isExpanded: true,
                            hint: const Text('Select Discount Code'),
                            items: controller.discountDropDown
                                .map((DiscountDropDown item) =>
                                    DropdownMenuItem<String>(
                                      value: item.discountCode,
                                      child: Text(item.discountCode.toString()),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.selectedDiscountID.value = value;
                              }
                            },
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),

                  //dropdown
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
                            value: controller
                                        .fulfillmentStatusController.value ==
                                    ''
                                ? null
                                : controller.fulfillmentStatusController.value,
                            isExpanded: true,
                            hint: const Text('Select Fulfillment Status'),
                            items: ['Processing', 'Shipped', 'Cancelled']
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.fulfillmentStatusController.value =
                                    value;
                              }
                            },
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  //fulfillmentDate
                  TextFormField(
                    controller: controller.fulfilledDateController,
                    decoration: const InputDecoration(
                      labelText: 'Fulfillment Date',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the fulfillment date';
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      if (picked != null) {
                        if (picked.isBefore(DateTime.now())) {
                          //dont pick the date
                          Get.snackbar('Error',
                              'Fulfillment date cannot be in the future',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.redAccent);
                        } else {
                          controller.fulfilledDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      }
                      ;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

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
                            value: controller.selectedSalesChannelID.value == 0
                                ? null
                                : controller.selectedSalesChannelID.value
                                    .toString(),
                            isExpanded: true,
                            hint: const Text('Select Sales Channel'),
                            items: controller.salesChannelDropDown
                                .map((SalesChannelDropDown item) =>
                                    DropdownMenuItem<String>(
                                      value: item.channelId.toString(),
                                      child: Text(item.name.toString()),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.selectedSalesChannelID.value =
                                    int.parse(value);
                              }
                            },
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),

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
                            value: controller.selectedGiftCardID.value == 0
                                ? null
                                : controller.selectedGiftCardID.value
                                    .toString(),
                            isExpanded: true,
                            hint: const Text('Select Gift Card'),
                            items: controller.giftCardDropDown
                                .map((GiftCardDropDown item) =>
                                    DropdownMenuItem<String>(
                                      value: item.giftCardNumber.toString(),
                                      child:
                                          Text(item.giftCardNumber.toString()),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.selectedGiftCardID.value =
                                    int.parse(value);
                              }
                            },
                          ),
                        ),
                      )),

                  const SizedBox(
                    height: 10,
                  ),

                  //dropdown
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
                            value:
                                controller.paymentMethodController.value == ''
                                    ? null
                                    : controller.paymentMethodController.value,
                            isExpanded: true,
                            hint: const Text('Select Payment Method'),
                            items: [
                              'Credit Card',
                              'Debit Card',
                              'Easy Paisa',
                              'Cash on Delivery',
                              'Bank Transfer'
                            ]
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.paymentMethodController.value =
                                    value;
                              }
                            },
                          ),
                        ),
                      )),

                  const SizedBox(
                    height: 10,
                  ),
                  //Payment Status
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
                            value:
                                controller.paymentStatusController.value == ''
                                    ? null
                                    : controller.paymentStatusController.value,
                            isExpanded: true,
                            hint: const Text('Select Payment Status'),
                            items: ['Paid', 'Pending']
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.paymentStatusController.value =
                                    value;
                              }
                            },
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.paymentDateController,
                    decoration: const InputDecoration(
                      labelText: 'Payment Date',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the payment date';
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      if (picked != null) {
                        if (picked.isBefore(DateTime.now())) {
                          //dont pick the date
                          Get.snackbar(
                              'Error', 'Payment date cannot be in the future',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.redAccent);
                        } else {
                          controller.paymentDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        }
                      }
                      ;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Select Shipper
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
                            value: controller.selectedShipperID.value == 0
                                ? null
                                : controller.selectedShipperID.value.toString(),
                            isExpanded: true,
                            hint: const Text('Select Shipper'),
                            items: controller.shipperDropDown
                                .map((ShipperDropDown item) =>
                                    DropdownMenuItem<String>(
                                      value: item.shipperID.toString(),
                                      child: Text(item.shipperName.toString()),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                controller.selectedShipperID.value =
                                    int.parse(value);
                              }
                            },
                          ),
                        ),
                      )),
                  //Show Selected Product here
                  //Selected Product List

                  const SizedBox(height: 10),
                  //prouct dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Select Products',
                            style: TextStyle(
                                fontSize: Get.width * 0.008,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.selectedProductList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(
                                    controller.productDropDown
                                        .firstWhere(
                                            (product) =>
                                                product.sku.toString() ==
                                                controller
                                                    .selectedProductList[index]
                                                        ['productID']
                                                    .toString(),
                                            orElse: () => ProductDropDown(
                                                sku: 101,
                                                name: 'Unknown product'))
                                        .name,
                                    style: TextStyle(
                                        fontSize: Get.width * .007,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    "(x${controller.selectedProductList[index]['quantity'].toString()})",
                                    style: TextStyle(
                                        fontSize: Get.width * .007,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  focusColor: Colors.transparent,
                                  value: controller.selectedProductID.value == 0
                                      ? null
                                      : controller.selectedProductID.value
                                          .toString(),
                                  isExpanded: true,
                                  hint: const Text('Select Product'),
                                  items: controller.productDropDown
                                      .map((ProductDropDown item) =>
                                          DropdownMenuItem<String>(
                                            value: item.sku.toString(),
                                            child: Text(item.name.toString()),
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      controller.selectedProductID.value =
                                          int.parse(value);
                                    }
                                  },
                                ),
                              ),
                            )),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                controller.decrement();
                              },
                            ),
                            Obx(
                              () => Text(controller.quantity.value.toString()),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                controller.increment();
                              },
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.grasGreenClr,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                RxMap<String, int> product = {
                                  'productID':
                                      controller.selectedProductID.value,
                                  'quantity': controller.quantity.value
                                }.obs;

                                controller.selectedProductList.add(product);

                                //reset quantity and product id after adding
                                controller.quantity.value = 1;
                                controller.selectedProductID.value = 0;
                              },
                              child: const Text('Add',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Obx(
                    () => CustomButton(
                      loading: controller.customButtonLoading.value,
                      onTap: () {
                        final res = controller.addOrder();
                      },
                      title: 'Add Order',
                      icon: const SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? formatDate(String date) {
  if (date == null || date.isEmpty) {
    return null;
  }
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formattedDate = formatter.format(parsedDate);
  return formattedDate;
}

paymentDetailDailog(OrderController controller, int OrderID) {
  Get.dialog(
    Dialog(
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
          width: Get.width * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Payment Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: controller.getPaymentByOrderID(OrderID),
                builder: (context, snapshot) {
                  //log('Payment Details: ${snapshot.data}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DailogDetailWidget(
                            title: 'Payment ID',
                            value: snapshot.data?[0]['PaymentID'].toString(),
                          ),
                          DailogDetailWidget(
                            title: 'Payment date',
                            value: snapshot.data?[0]["PaymentDate"] != null
                                ? formatDate(snapshot.data?[0]["PaymentDate"])
                                : 'N/A',
                          ),
                          DailogDetailWidget(
                            title: 'Payment Method',
                            value: snapshot.data?[0]['PaymentMethod'],
                          ),
                          DailogDetailWidget(
                            title: 'Payment Amount',
                            value: snapshot.data?[0]['Amount'].toString(),
                          ),
                          CustomDailogDetailWidget(
                            iconButton: (snapshot.data?[0]['PaymentStatus'] ==
                                    'Paid')
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      updatePaymentStatusDailog(
                                          controller,
                                          OrderID,
                                          snapshot.data?[0]['PaymentStatus']);
                                    },
                                    icon: const Icon(Icons.edit)),
                            title: 'Payment Status',
                            value: snapshot.data?[0]['PaymentStatus'],
                          ),
                          //const Spacer(),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                title: 'Close',
                                icon: const SizedBox(),
                                onTap: () {
                                  Get.back();
                                },
                              ))
                        ]);
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          )),
    ),
  );
}

deliveryDetailDailog(OrderController controller, int OrderID) {
  Get.dialog(
    Dialog(
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
          // height: Get.height * 0.7,
          width: Get.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Delivery Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: controller.getDeliveryByOrderID(OrderID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DailogDetailWidget(
                            title: 'Order ID',
                            value: snapshot.data?[0]['OrderID'].toString(),
                          ),
                          DailogDetailWidget(
                            title: 'Customer Name',
                            value: snapshot.data?[0]['Name'],
                          ),
                          DailogDetailWidget(
                            title: 'Address',
                            value: snapshot.data?[0]['Address'],
                          ),
                          DailogDetailWidget(
                            title: 'Shipper Name',
                            value: snapshot.data?[0]['ShipperName'],
                          ),
                          DailogDetailWidget(
                            title: 'Shipping Services',
                            value: snapshot.data?[0]['ShippingServices'],
                          ),
                          DailogDetailWidget(
                            title: 'Shipping Rates',
                            value:
                                snapshot.data?[0]['ShippingRates'].toString(),
                          ),
                          CustomDailogDetailWidget(
                            iconButton: (snapshot.data?[0]['CurrentStatus'] ==
                                    'Delivered')
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      updateTrackingStatusDailog(
                                          controller,
                                          OrderID,
                                          snapshot.data?[0]['CurrentStatus']);
                                    },
                                    icon: const Icon(Icons.edit)),
                            title: 'Delivery Status',
                            value: snapshot.data?[0]['CurrentStatus'],
                          ),
                          DailogDetailWidget(
                            title: 'Estimated Delivery Date',
                            value: formatDate(
                                snapshot.data?[0]['EstimatedDeliveryDate']),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                title: 'Close',
                                icon: const SizedBox(),
                                onTap: () {
                                  Get.back();
                                },
                              ))
                        ]);
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          )),
    ),
  );
}

updatePaymentStatusDailog(
    OrderController controller, int OrderID, String currentStatus) {
  Get.dialog(
    Dialog(
      elevation: 1,
      backgroundColor: AppTheme.whiteselClr,
      child: Container(
          width: Get.width * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Update Payment Status',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        value: controller.newPaymentStatus.value == ''
                            ? null
                            : controller.newPaymentStatus.value,
                        isExpanded: true,
                        hint: Text("${currentStatus}"),
                        items: ['Pending', 'Paid']
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.newPaymentStatus.value = value;
                          }
                        },
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Obx(
                  () => CustomButton(
                    loading: controller.customButtonLoading.value,
                    title: 'Update',
                    icon: const Icon(
                      Icons.update_rounded,
                      color: AppTheme.whiteselClr,
                    ),
                    onTap: () async {
                      await controller.updatePaymentStatus(OrderID);
                      Get.back();
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}

updateTrackingStatusDailog(
    OrderController controller, int orderID, String currentStatus) {
  Get.dialog(
    Dialog(
      elevation: 1,
      backgroundColor: AppTheme.whiteselClr,
      child: Container(
          width: Get.width * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Update Tracking Status',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        value: controller.newTrackingStatus.value == ''
                            ? null
                            : controller.newTrackingStatus.value,
                        isExpanded: true,
                        hint: Text("${currentStatus}"),
                        items: [
                          'In Transit',
                          'Pending Pickup',
                          'Out for Delivery',
                          'Delivered'
                          // 'Cancelled'
                        ]
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.newTrackingStatus.value = value;
                          }
                        },
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Obx(
                  () => CustomButton(
                    loading: controller.customButtonLoading.value,
                    title: 'Update',
                    icon: const Icon(
                      Icons.update_rounded,
                      color: AppTheme.whiteselClr,
                    ),
                    onTap: () async {
                      await controller.updateTrackingStatus(orderID);
                      Get.back();
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}
