class OrderView {
  final int orderId;
  final String customerName;
  final String productName;
  final DateTime orderDate;
  final String currentStatus;
  final String salesChannelName;
  final double paymentAmount;

  OrderView({
    required this.orderId,
    required this.customerName,
    required this.productName,
    required this.orderDate,
    required this.currentStatus,
    required this.salesChannelName,
    required this.paymentAmount,
  });

  factory OrderView.fromJson(Map<String, dynamic> json) {
    return OrderView(
      orderId: json['OrderID'],
      customerName: json['CustomerName'],
      productName: json['ProductName'],
      orderDate: DateTime.parse(json['OrderDate']),
      currentStatus: json['CurrentStatus'],
      salesChannelName: json['SalesChannelName'],
      paymentAmount: json['PaymentAmount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrderID': orderId,
      'CustomerName': customerName,
      'ProductName': productName,
      'OrderDate': orderDate.toIso8601String(),
      'CurrentStatus': currentStatus,
      'SalesChannelName': salesChannelName,
      'PaymentAmount': paymentAmount,
    };
  }
}
