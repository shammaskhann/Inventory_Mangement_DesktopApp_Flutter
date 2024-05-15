import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/components/info_blockks.dart';
import 'package:shopify_admin_dashboard/views/components/tag_container.dart';
import 'package:shopify_admin_dashboard/views/home/components/topProductsHeader.dart';
import 'package:shopify_admin_dashboard/views/home/components/vendors_chart.dart';
import 'package:shopify_admin_dashboard/views/home/controller/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/models/graphmodels/VendorData.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VendorData> data = [
      VendorData('Apple', 30.7692307692308),
      VendorData('Samsung', 23.0769230769231),
      VendorData('Sony', 23.0769230769231),
      VendorData('Google', 15.3846153846154),
      VendorData('Amazon', 7.69230769230769),
    ];
    HomeController homeScreenController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 90.0, left: 30, top: 30),
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
                height: 50,
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
                      text: 'Online',
                      iconColor: AppTheme.grasGreenClr,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Info Block
              Row(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: homeScreenController.getTodaySalesInfoBlock(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  //today order
                  Expanded(
                    child: FutureBuilder(
                      future:
                          homeScreenController.getTodayOrderCountInfoBlock(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  ),
                  //get Total Revenue
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: homeScreenController.getTotalRevenue(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  ),
                  //get Totl Products
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: homeScreenController.getTotalCountOfProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: Get.width * 0.5,
                          decoration:
                              const BoxDecoration(color: AppTheme.secondaryClr),
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: Row(children: [
                              Text(
                                '   TOP SELLING PRODUCTS',
                                style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ]),
                          ),
                        ),
                      ),
                      const TopProductHeader(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: Get.width * 0.5,
                          child: FutureBuilder(
                            future:
                                homeScreenController.getTopSellingProducts(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                    height: Get.height * 0.4,
                                    child: const Center(
                                        child: LoadingIndicator()));
                              } else if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                // Handle the case when the future is still running
                                return const CircularProgressIndicator();
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return SizedBox(
                                    child: Text('${snapshot.error}'),
                                  );
                                } else if (snapshot.hasData) {
                                  // List Show of 5 top selling products
                                  return ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          color: (index % 2 == 0)
                                              ? AppTheme.secondaryClr
                                              : AppTheme.darkThemeBackgroudClr,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.07,
                                                  child: Text(
                                                    snapshot.data![index].SKU
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.1,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .productName,
                                                    style: const TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.1,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .vendorName,
                                                    style: const TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.1,
                                                  child: Text(
                                                    snapshot
                                                        .data![index].category,
                                                    style: const TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.07,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .quantitySold
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Top Suppliers',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.whiteselClr)),
                      // VendorProductChart(
                      //   data: data,
                      // )
                      Container(
                          padding: const EdgeInsets.only(top: 8),
                          height: Get.height * 0.4,
                          width: Get.width * 0.3,
                          child: FutureBuilder(
                              future:
                                  homeScreenController.getTopVendorPieChart(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: LoadingIndicator(),
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return SizedBox(
                                      child: Text('${snapshot.error}'),
                                    );
                                  } else if (snapshot.hasData) {
                                    return SfCircularChart(
                                      legend: const Legend(
                                        isVisible: true,
                                        overflowMode:
                                            LegendItemOverflowMode.wrap,
                                        position: LegendPosition.bottom,
                                        textStyle: TextStyle(
                                            color: AppTheme.whiteselClr),
                                      ),
                                      margin: const EdgeInsets.all(0),
                                      series: <PieSeries<VendorData, String>>[
                                        PieSeries<VendorData, String>(
                                          radius: '100%',
                                          dataSource: snapshot.data!,
                                          xValueMapper:
                                              (VendorData vendor, _) =>
                                                  vendor.vendorName,
                                          yValueMapper:
                                              (VendorData vendor, _) =>
                                                  vendor.percentage,
                                          dataLabelMapper:
                                              (VendorData vendor, _) =>
                                                  vendor.vendorName,
                                          // Display the vendor name on the data labels
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true),
                                          enableTooltip: true,
                                        )
                                      ],
                                    );
                                  }
                                }
                                return const SizedBox();
                              }))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String product;
  final int sales;

  SalesData(this.product, this.sales);
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
