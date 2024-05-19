class PurchaseOrder {
  final int purchaseOrderID;
  final String supplierName;
  final String status;
  final String product;
  final int orderedQuantity;
  final double totalCost;
  final String expectedArrivalDate;

  PurchaseOrder({
    required this.purchaseOrderID,
    required this.supplierName,
    required this.status,
    required this.product,
    required this.orderedQuantity,
    required this.totalCost,
    required this.expectedArrivalDate,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      purchaseOrderID: json['PurchaseOrderID'],
      supplierName: json['SupplierName'],
      status: json['Status'],
      product: json['Product'],
      orderedQuantity: json['orderedQuantity'],
      totalCost: json['TotalCost'].toDouble(),
      expectedArrivalDate: json['ExpectedArrivalDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PurchaseOrderID': purchaseOrderID,
      'SupplierName': supplierName,
      'Status': status,
      'Product': product,
      'orderedQuantity': orderedQuantity,
      'TotalCost': totalCost,
      'ExpectedArrivalDate': expectedArrivalDate,
    };
  }
}
