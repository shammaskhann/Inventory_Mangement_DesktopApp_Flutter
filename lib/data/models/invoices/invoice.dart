class Invoice {
  final int invoiceID;
  final int orderID;
  final int supplierID;
  final String dateOfIssue;
  final String dueDate;
  final double totalAmount;
  final String supplierName;
  final String paymentStatus;

  Invoice({
    required this.invoiceID,
    required this.orderID,
    required this.supplierID,
    required this.dateOfIssue,
    required this.dueDate,
    required this.totalAmount,
    required this.supplierName,
    required this.paymentStatus,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      invoiceID: json['InvoiceID'],
      orderID: json['OrderID'],
      supplierID: json['supplierID'],
      dateOfIssue: json['DateOfIssue'],
      dueDate: json['DueDate'],
      totalAmount: json['TotalAmount'].toDouble(),
      supplierName: json['SupplierName'],
      paymentStatus: json['PaymentStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'InvoiceID': invoiceID,
      'OrderID': orderID,
      'supplierID': supplierID,
      'DateOfIssue': dateOfIssue,
      'DueDate': dueDate,
      'TotalAmount': totalAmount,
      'SupplierName': supplierName,
      'PaymentStatus': paymentStatus,
    };
  }
}
