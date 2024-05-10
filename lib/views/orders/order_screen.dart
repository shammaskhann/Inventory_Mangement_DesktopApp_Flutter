import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/theme/app_themes.dart';
import '../../data/graphmodels/SiteVisit.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      width: Get.height * 0.88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              height: Get.height * 0.4,
              width: Get.width * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        labelStyle: TextStyle(color: AppTheme.whiteselClr),
                      ),
                      primaryYAxis: const NumericAxis(
                        isVisible: true,
                        majorGridLines: MajorGridLines(width: 0.5),
                        minorGridLines: MinorGridLines(width: 0),
                        axisLine: AxisLine(color: AppTheme.whiteselClr),
                        labelStyle: TextStyle(color: AppTheme.whiteselClr),
                      ),
                      series: <CartesianSeries<SiteVisit, String>>[
                        SplineSeries<SiteVisit, String>(
                          dataLabelSettings: const DataLabelSettings(
                              textStyle: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontWeight: FontWeight.bold),
                              isVisible: true),
                          animationDelay: 10,
                          splineType: SplineType.monotonic,
                          color: AppTheme.grasGreenClr,
                          dataSource: data,
                          xValueMapper: (SiteVisit orders, _) => orders.time,
                          yValueMapper: (SiteVisit orders, _) => orders.visit,
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
          ),
        ],
      ),
    );
  }
}
