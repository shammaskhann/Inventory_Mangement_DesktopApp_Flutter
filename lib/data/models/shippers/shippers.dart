class Shipper {
  final int shipperID;
  final String shipperName;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  final String address;
  final String shippingServices;
  final double shippingRates;
  final String trackingURL;

  Shipper({
    required this.shipperID,
    required this.shipperName,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    required this.address,
    required this.shippingServices,
    required this.shippingRates,
    required this.trackingURL,
  });

  factory Shipper.fromJson(Map<String, dynamic> json) {
    return Shipper(
      shipperID: json['ShipperID'],
      shipperName: json['ShipperName'],
      contactPerson: json['ContactPerson'],
      contactEmail: json['ContactEmail'],
      contactPhone: json['ContactPhone'],
      address: json['Address'],
      shippingServices: json['ShippingServices'],
      shippingRates: json['ShippingRates'].toDouble(),
      trackingURL: json['TrackingURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ShipperID': shipperID,
      'ShipperName': shipperName,
      'ContactPerson': contactPerson,
      'ContactEmail': contactEmail,
      'ContactPhone': contactPhone,
      'Address': address,
      'ShippingServices': shippingServices,
      'ShippingRates': shippingRates,
      'TrackingURL': trackingURL,
    };
  }
}
