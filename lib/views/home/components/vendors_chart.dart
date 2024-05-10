import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VendorProductChart extends StatelessWidget {
  List<VendorData>? data;

  VendorProductChart({this.data});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Top Vendors by Product Count'),
      legend: Legend(isVisible: true),
      series: <PieSeries<VendorData, String>>[
        PieSeries<VendorData, String>(
          dataSource: data ??
              <VendorData>[
                VendorData('Apple', 100),
                VendorData('Intel', 200),
                VendorData('Nvidia', 150),
                VendorData('AMD', 180),
                VendorData('Dell', 220),
                VendorData('Xiaomi', 90),
              ],
          xValueMapper: (VendorData vendor, _) => vendor.vendorName,
          yValueMapper: (VendorData vendor, _) => vendor.productCount,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class VendorData {
  final String vendorName;
  final int productCount;

  VendorData(this.vendorName, this.productCount);
}
