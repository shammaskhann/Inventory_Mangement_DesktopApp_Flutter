import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/graphmodels/SiteVisit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SiteVisit> data = [
      SiteVisit(time: '12:00 AM', visit: 60),
      SiteVisit(time: '3:00 AM', visit: 50),
      SiteVisit(time: '6:00 AM', visit: 5),
      SiteVisit(time: '9:00 AM', visit: 30),
      SiteVisit(time: '12:00 PM', visit: 50),
      SiteVisit(time: '3:00 PM', visit: 25),
      SiteVisit(time: '6:00 PM', visit: 5),
    ];
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //allign left
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome to Shopify Admin Dashboard',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.lightGreyClr)),
                  Text('Here\'s what\'s happening with your store today.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.lightGreyClr)),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              //below all allign to center
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: AppTheme.secondaryClr,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Icon(Icons.calendar_month,
                                    size: 12, color: AppTheme.whiteselClr),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Today',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.whiteselClr,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: AppTheme.secondaryClr,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text('All Channels',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.whiteselClr,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: AppTheme.secondaryClr,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Icon(Icons.circle,
                                    size: 12, color: AppTheme.grasGreenClr),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('4 live visitors',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.whiteselClr,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.4,
                      width: Get.width * 0.7,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryClr,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Container(
                              height: Get.height * 0.08,
                              width: Get.width * 0.1,
                              decoration: BoxDecoration(
                                color: AppTheme.lightGreyClr.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Online Store Sessions',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.whiteselClr)),
                                    Divider(
                                      color: AppTheme.lightGreyClr,
                                      endIndent: 40,
                                    ),
                                    Row(
                                      children: [
                                        Text('346',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.whiteselClr)),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_drop_up,
                                          color: AppTheme.grasGreenClr,
                                        ),
                                        Text('12%',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.grasGreenClr)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
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
                              series: <CartesianSeries<SiteVisit, String>>[
                                SplineSeries<SiteVisit, String>(
                                  animationDelay: 10,
                                  splineType: SplineType.monotonic,
                                  color: AppTheme.grasGreenClr,
                                  dataSource: data,
                                  xValueMapper: (SiteVisit orders, _) =>
                                      orders.time,
                                  yValueMapper: (SiteVisit orders, _) =>
                                      orders.visit,
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
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Things to do next',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.lightGreyClr))),
                    Row(
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryClr,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(AppIcons.orderIcon),
                                  Text('',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.lightGreyClr)),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //Total Sales Card with Graph spline

              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('Total Sales',
              //         style: TextStyle(
              //             fontSize: Get.height * 0.02,
              //             fontWeight: FontWeight.bold,
              //             color: AppTheme.whiteselClr)),
              //     Text('\$ 19,999.99',
              //         style: TextStyle(
              //             fontSize: Get.height * 0.03,
              //             fontWeight: FontWeight.bold,
              //             color: AppTheme.whiteselClr)),
              //     Container(
              //       height: Get.height * 0.12,
              //       width: Get.width * 0.1,
              //       child: SfCartesianChart(
              //         plotAreaBorderWidth: 0,
              //         primaryXAxis: const CategoryAxis(
              //           isVisible: true,
              //           majorGridLines: MajorGridLines(width: 0),
              //           axisLine:
              //               AxisLine(color: AppTheme.whiteselClr),
              //           labelStyle:
              //               TextStyle(color: Colors.transparent),
              //         ),
              //         primaryYAxis: const NumericAxis(
              //           isVisible: true,
              //           majorGridLines: MajorGridLines(width: 0),
              //           minorGridLines: MinorGridLines(width: 0),
              //           axisLine:
              //               AxisLine(color: AppTheme.whiteselClr),
              //           labelStyle:
              //               TextStyle(color: Colors.transparent),
              //         ),
              //         series: <CartesianSeries<OrderData, String>>[
              //           SplineSeries<OrderData, String>(
              //             color: AppTheme.grasGreenClr,
              //             dataSource: data,
              //             xValueMapper: (OrderData orders, _) =>
              //                 orders.year,
              //             yValueMapper: (OrderData orders, _) =>
              //                 orders.orders,
              //           )
              //         ],
              //       ),
              //       // child: SfSparkLineChart(
              //       //   data: <double>[0.5, 0.9, 0.7, 0.8, 0.6, 0.8],
              //       //   axisLineColor: AppTheme.lightGreyClr,
              //       //   axisLineWidth: 1,
              //       //   color: AppTheme.grasGreenClr,
              //       //   trackball: const SparkChartTrackball(
              //       //       activationMode:
              //       //           SparkChartActivationMode.tap),
              //       // ),
              //     ),
              //     const Divider(
              //       color: AppTheme.lightGreyClr,
              //     ),
              //     Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text('87 total orders',
              //             style: TextStyle(
              //                 fontSize: Get.height * 0.018,
              //                 fontWeight: FontWeight.w500,
              //                 color: AppTheme.lightGreyClr)),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
