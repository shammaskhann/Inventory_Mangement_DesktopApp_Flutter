class ShipmentModel {
  final int orderID;
  final String name;
  final String address;
  final String shipperName;
  final String shippingServices;
  final double shippingRates;
  final String currentStatus;
  final String estimatedDeliveryDate;
  ShipmentModel({
    required this.orderID,
    required this.name,
    required this.address,
    required this.shipperName,
    required this.shippingServices,
    required this.shippingRates,
    required this.currentStatus,
    required this.estimatedDeliveryDate,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(
      orderID: json['OrderID'],
      name: json['Name'],
      address: json['Address'],
      shipperName: json['ShipperName'],
      shippingServices: json['ShippingServices'],
      shippingRates: json['ShippingRates'].toDouble(),
      currentStatus: json['CurrentStatus'],
      estimatedDeliveryDate: json['EstimatedDeliveryDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderID'] = this.orderID;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['ShipperName'] = this.shipperName;
    data['ShippingServices'] = this.shippingServices;
    data['ShippingRates'] = this.shippingRates;
    data['CurrentStatus'] = this.currentStatus;
    data['EstimatedDeliveryDate'] = this.estimatedDeliveryDate;
    return data;
  }
}
