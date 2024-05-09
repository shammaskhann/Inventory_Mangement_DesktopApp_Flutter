import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_admin_dashboard/constant/icons/app_icons.dart';
import 'package:shopify_admin_dashboard/services/Sales%20Services/sales_services.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/components/info_blockks.dart';
import 'package:shopify_admin_dashboard/views/components/tag_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/graphmodels/SiteVisit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('Welcome to Dashboard',
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTagContainer(
                      iconData: Icons.calendar_month,
                      text: 'Today',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTagContainer(text: "All Channels"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTagContainer(
                      iconData: Icons.circle,
                      text: '4 live visitors',
                      iconColor: AppTheme.grasGreenClr,
                    ),
                  ],
                ),
              ),
              //Info Block
              Row(
                children: [
                  FutureBuilder(
                    future: SalesServices.getTodaySales(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                            gradient: AppTheme.shimmerEffectTile,
                            child: const InfoBlock(
                                value: "100k",
                                title: 'Today\'s Sale',
                                iconData: Icons.trending_up));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return InfoBlock(
                            value: snapshot.data.toString(),
                            title: 'Today\'s Sale',
                            iconData: Icons.trending_up,
                            avatarBackgroundColor: Colors.lightBlue);
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  //today order
                  FutureBuilder(
                    future: SalesServices.getTodayOrder(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                            gradient: AppTheme.shimmerEffectTile,
                            child: const InfoBlock(
                                value: "100k",
                                title: 'Today\'s Orders',
                                iconData: Icons.trending_up));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return InfoBlock(
                            value: snapshot.data.toString(),
                            title: 'Today\'s Orders',
                            iconData: Icons.list,
                            avatarBackgroundColor: Colors.purpleAccent);
                      }
                      return const SizedBox();
                    },
                  ),
                  //get Total Revenue
                  const SizedBox(
                    width: 20,
                  ),
                  FutureBuilder(
                    future: SalesServices.getTotalRevenue(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                            gradient: AppTheme.shimmerEffectTile,
                            child: const InfoBlock(
                                value: "100k",
                                title: 'Total Revenue',
                                iconData: Icons.trending_up));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return InfoBlock(
                          value: snapshot.data.toString(),
                          title: 'Total Revenue',
                          iconData: Icons.attach_money,
                          avatarBackgroundColor: Colors.orangeAccent,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  //get Totl Products
                  const SizedBox(
                    width: 20,
                  ),
                  FutureBuilder(
                    future: SalesServices.getTotalProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                            gradient: AppTheme.shimmerEffectTile,
                            child: const InfoBlock(
                                value: "100k",
                                title: 'Total Products',
                                iconData: Icons.trending_up));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return InfoBlock(
                          value: snapshot.data.toString(),
                          title: 'Total Products',
                          iconData: Icons.shopping_cart,
                          avatarBackgroundColor: Colors.pinkAccent,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
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