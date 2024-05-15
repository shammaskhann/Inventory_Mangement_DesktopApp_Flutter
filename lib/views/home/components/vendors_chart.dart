import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/graphmodels/VendorData.dart';

class VendorProductChart extends StatelessWidget {
  List<VendorData>? data;

  VendorProductChart({this.data});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <PieSeries<VendorData, String>>[
        PieSeries<VendorData, String>(
          dataSource: data,
          xValueMapper: (VendorData vendor, _) => vendor.vendorName,
          yValueMapper: (VendorData vendor, _) => vendor.percentage,
          dataLabelMapper: (VendorData vendor, _) =>
              vendor.vendorName, // Display the vendor name on the data labels
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true, // Enable animations
        )
      ],
    );
  }
}
