import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopify_admin_dashboard/data/models/graphmodels/discount_barchart.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/Merchant/discount/controller/discount_controller.dart';
import 'package:intl/intl.dart';
import '../../../constant/theme/app_themes.dart';
import '../../components/CustomButton.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DiscountController discountController = Get.put(DiscountController());
    return SingleChildScrollView(
      child: Container(
        color: AppTheme.darkThemeBackgroudClr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Discounts Code',
                  style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: 'ADD DISCOUNT CODE',
                  onTap: () {
                    showAddDiscountDailog(discountController);
                  },
                  icon: const SizedBox(),
                ),
              ]),
              const SizedBox(height: 20.0),
              SizedBox(
                height: Get.height * 0.35,
                width: Get.width,
                child: FutureBuilder(
                  future: discountController.getChartdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: LoadingIndicator());
                    } else {
                      return SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        // title:
                        //     const ChartTitle(text: 'Discount Codes Usage'),
                        //legend: const Legend(isVisible: true),
                        primaryXAxis: CategoryAxis(
                          labelStyle: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.005,
                          ),
                          majorGridLines: const MajorGridLines(
                              width: 0, color: Colors.transparent),
                        ),
                        primaryYAxis: NumericAxis(
                          labelStyle: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.008,
                          ),
                          majorTickLines:
                              const MajorTickLines(color: Colors.transparent),
                          axisLine: const AxisLine(width: 0),
                          minimum: 0,
                        ),
                        series: <LineSeries<DiscountData, String>>[
                          LineSeries<DiscountData, String>(
                            dataSource: snapshot.data,
                            xValueMapper: (DiscountData sales, _) =>
                                sales.discountCode,
                            yValueMapper: (DiscountData sales, _) =>
                                sales.noOfOrders,
                            dataLabelSettings: const DataLabelSettings(
                              textStyle: TextStyle(
                                color: AppTheme.whiteselClr,
                              ),
                              isVisible: true,
                              labelAlignment: ChartDataLabelAlignment.top,
                            ),
                            color: Colors.blue,
                            markerSettings: const MarkerSettings(
                                color: AppTheme.grasGreenClr, isVisible: true),
                          )
                        ],
                      );
                      // return SfCartesianChart(
                      //   plotAreaBorderWidth: 0,
                      //   primaryXAxis: const CategoryAxis(
                      //     majorGridLines: MajorGridLines(width: 0),
                      //   ),
                      //   primaryYAxis: const NumericAxis(
                      //     majorTickLines:
                      //         MajorTickLines(color: Colors.transparent),
                      //     axisLine: AxisLine(width: 0),
                      //     minimum: 0,
                      //   ),
                      //   legend: const Legend(isVisible: false),
                      //   series: <BarSeries<DiscountData, String>>[
                      //     BarSeries<DiscountData, String>(
                      //         dataSource: snapshot.data,
                      //         xValueMapper: (DiscountData sales, _) =>
                      //             sales.discountCode,
                      //         yValueMapper: (DiscountData sales, _) =>
                      //             sales.noOfOrders,
                      //         dataLabelSettings: const DataLabelSettings(
                      //             isVisible: true,
                      //             labelAlignment:
                      //                 ChartDataLabelAlignment.top),
                      //         color: AppTheme.grasGreenClr),
                      //   ],
                      // );
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: AppTheme.secondaryClr,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.1,
                      child: Text('Discount Code',
                          style: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.009,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      width: Get.width * 0.1,
                      child: Text('Discount Amount',
                          style: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.009,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    //No of redemptions
                    SizedBox(
                      width: Get.width * 0.1,
                      child: Text('No of redemptions',
                          style: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.009,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder(
                      init: discountController,
                      builder: (controller) {
                        return FutureBuilder(
                          future: discountController.getDiscountCode(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                  height: Get.height * 0.5,
                                  width: Get.width * 0.5,
                                  child: Center(child: LoadingIndicator()));
                            } else {
                              return Expanded(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Container(
                                          width: Get.width * 0.5,
                                          color: AppTheme.secondaryClr,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                    snapshot.data[index]
                                                        ['DiscountCode'],
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.008,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                    "\$${snapshot.data[index]['DiscountAmount'].toString()}",
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.008,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                    snapshot.data[index]
                                                            ['NoOfOrders']
                                                        .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.008,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Expanded(
                                        child:
                                            Center(child: LoadingIndicator()),
                                      );
                                    }
                                  },
                                ),
                              );
                            }
                          },
                        );
                      }),
                  const SizedBox(width: 10),
                  //barChart
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddDiscountDailog(DiscountController controller) {
  Get.dialog(Dialog(
    elevation: 1,
    backgroundColor: AppTheme.whiteselClr,
    child: Container(
      height: Get.height * 0.3,
      width: Get.width * 0.3,
      padding: const EdgeInsets.all(20),
      child: Form(
          key: controller.key,
          child: Column(
            children: [
              const Text(
                'ADD NEW DISCOUNT CODE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.discountCode,
                decoration: const InputDecoration(
                  hintText: 'Enter Discount Code',
                  hintStyle: TextStyle(color: Colors.black),
                  floatingLabelStyle: TextStyle(color: AppTheme.grasGreenClr),
                  labelText: 'Enter Discount Code',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.grasGreenClr),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter discount code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.discountAmount,
                decoration: const InputDecoration(
                  hintText: 'Enter Discount Amount',
                  hintStyle: TextStyle(color: Colors.black),
                  floatingLabelStyle: TextStyle(color: AppTheme.grasGreenClr),
                  labelText: 'Enter Discount Amount',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.grasGreenClr),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter discount amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: 'ADD DISCOUNT CODE',
                onTap: () async {
                  controller.addDiscountCode();
                },
                icon: const SizedBox(),
              ),
            ],
          )),
    ),
  ));
}
