class OrderModel {
  final String orderDate;
  final int customerID;
  final String discountCode;
  final String fulfillmentStatus;
  final String fulfilledDate;
  final int salesChannelID;
  final String giftCard;
  final String paymentMethod;
  final String paymentDate;
  final String paymentStatus;
  final int shipperID;
  final List<int> productIDs;

  OrderModel({
    required this.orderDate,
    required this.customerID,
    required this.discountCode,
    required this.fulfillmentStatus,
    required this.fulfilledDate,
    required this.salesChannelID,
    required this.giftCard,
    required this.paymentMethod,
    required this.paymentDate,
    required this.paymentStatus,
    required this.shipperID,
    required this.productIDs,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderDate': orderDate,
      'customerID': customerID,
      'discountCode': discountCode,
      'fulfillmentStatus': fulfillmentStatus,
      'fulfilledDate': fulfilledDate,
      'salesChannelID': salesChannelID,
      'giftCard': giftCard,
      'paymentMethod': paymentMethod,
      'paymentDate': paymentDate,
      'paymentStatus': paymentStatus,
      'shipperID': shipperID,
      'productIDs': productIDs,
    };
  }
}
