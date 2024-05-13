import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_admin_dashboard/data/graphmodels/PastWeekOrders.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';
import 'package:shopify_admin_dashboard/views/components/tag_container.dart';
import 'package:shopify_admin_dashboard/views/components/info_blocks2.dart';
import 'package:shopify_admin_dashboard/views/orders/components/customer_wdiget.dart';
import 'package:shopify_admin_dashboard/views/orders/components/orderlist_header.dart';
import 'package:shopify_admin_dashboard/views/orders/controller/order_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/graphmodels/SiteVisit.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController());
    final List<SiteVisit> data = [
      SiteVisit(time: '12:00 AM', visit: 60),
      SiteVisit(time: '3:00 AM', visit: 50),
      SiteVisit(time: '6:00 AM', visit: 5),
      SiteVisit(time: '9:00 AM', visit: 30),
      SiteVisit(time: '12:00 PM', visit: 50),
      SiteVisit(time: '3:00 PM', visit: 25),
      SiteVisit(time: '6:00 PM', visit: 5),
    ];
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      width: Get.height * 0.88,
      child: Padding(
        padding: const EdgeInsets.only(right: 90.0, left: 30, top: 30),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
                  onTap: () {},
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
                                return Text('Error: ${snapshot.error}');
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
                    height: Get.height * 0.02,
                  ),
                  // ignore: sized_box_for_whitespace
                  FutureBuilder(
                      future: orderController.getGraphPastWeekOrders(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: Get.height * 0.2,
                            child: const Center(child: LoadingIndicator()),
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
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Row(children: [
                  const Text(
                    '   Recent Orders',
                    style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: 20,
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
                            fontSize: 14,
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
            FutureBuilder(
              future: orderController
                  .getOrderList(orderController.selectedTimeSpan.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      height: Get.height * 0.2,
                      child: const Center(child: LoadingIndicator()));
                } else {
                  return Container(
                    decoration:
                        const BoxDecoration(color: AppTheme.secondaryClr),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return CustomerWidget(
                          orderId: snapshot.data![index]['orderID'].toString(),
                          customer: snapshot.data![index]['CustomerName'],
                          product: snapshot.data![index]['Product'],
                          date: snapshot.data![index]['OrderDate'],
                          status: snapshot.data![index]['Status'],
                          channel: snapshot.data![index]['Channel'],
                          total: snapshot.data![index]['Total'].toString(),
                        );
                      },
                    ),
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
