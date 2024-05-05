import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../constant/theme/app_themes.dart';

class OrderData {
  OrderData(this.year, this.orders);

  final String year;
  final int orders;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderData> data = [
      OrderData('2016', 50),
      OrderData('2017', 20),
      OrderData('2018', 30),
      OrderData('2019', 40),
      OrderData('2020', 10),
    ];
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      body: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 20, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome to Shopify Admin Dashboard',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.lightGreyClr)),
                const Text('Here\'s what\'s happening with your store today.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.lightGreyClr)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    //Total Sales Card with Graph spline
                    Container(
                      height: Get.height * 0.25,
                      width: Get.width * 0.25,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryClr,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Sales',
                              style: TextStyle(
                                  fontSize: Get.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.whiteselClr)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$ 19,999.99',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.whiteselClr)),
                              Container(
                                height: Get.height * 0.12,
                                width: Get.width * 0.1,
                                child: SfCartesianChart(
                                  plotAreaBorderWidth: 0,
                                  primaryXAxis: const CategoryAxis(
                                    isVisible: true,
                                    majorGridLines: MajorGridLines(width: 0),
                                    axisLine:
                                        AxisLine(color: AppTheme.whiteselClr),
                                    labelStyle:
                                        TextStyle(color: Colors.transparent),
                                  ),
                                  primaryYAxis: const NumericAxis(
                                    isVisible: true,
                                    majorGridLines: MajorGridLines(width: 0),
                                    minorGridLines: MinorGridLines(width: 0),
                                    axisLine:
                                        AxisLine(color: AppTheme.whiteselClr),
                                    labelStyle:
                                        TextStyle(color: Colors.transparent),
                                  ),
                                  series: <CartesianSeries<OrderData, String>>[
                                    SplineSeries<OrderData, String>(
                                      color: AppTheme.grasGreenClr,
                                      dataSource: data,
                                      xValueMapper: (OrderData orders, _) =>
                                          orders.year,
                                      yValueMapper: (OrderData orders, _) =>
                                          orders.orders,
                                    )
                                  ],
                                ),
                                // child: SfSparkLineChart(
                                //   data: <double>[0.5, 0.9, 0.7, 0.8, 0.6, 0.8],
                                //   axisLineColor: AppTheme.lightGreyClr,
                                //   axisLineWidth: 1,
                                //   color: AppTheme.grasGreenClr,
                                //   trackball: const SparkChartTrackball(
                                //       activationMode:
                                //           SparkChartActivationMode.tap),
                                // ),
                              )
                            ],
                          ),
                          const Divider(
                            color: AppTheme.lightGreyClr,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('87 total orders',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.018,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.lightGreyClr)),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    Container(
                      height: Get.height * 0.25,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryClr,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
