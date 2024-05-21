class PurchaseOrder {
  final int purchaseOrderID;
  final String supplierName;
  String? status = 'Pending'; // make status nullable
  final String product;
  final int orderedQuantity;
  final double totalCost;
  final String expectedArrivalDate;

  PurchaseOrder({
    required this.purchaseOrderID,
    required this.supplierName,
    this.status, // remove required
    required this.product,
    required this.orderedQuantity,
    required this.totalCost,
    required this.expectedArrivalDate,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      purchaseOrderID: json['PurchaseOrderID'],
      supplierName: json['SupplierName'],
      status: json['Status'], // status can now be null
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
