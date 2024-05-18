class Supplier {
  final int supplierID;
  final String supplierName;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  final String address;
  final String paymentTerms;

  Supplier({
    required this.supplierID,
    required this.supplierName,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    required this.address,
    required this.paymentTerms,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      supplierID: json['SupplierID'],
      supplierName: json['SupplierName'],
      contactPerson: json['ContactPerson'],
      contactEmail: json['ContactEmail'],
      contactPhone: json['ContactPhone'],
      address: json['Address'],
      paymentTerms: json['PaymentTerms'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SupplierID': supplierID,
      'SupplierName': supplierName,
      'ContactPerson': contactPerson,
      'ContactEmail': contactEmail,
      'ContactPhone': contactPhone,
      'Address': address,
      'PaymentTerms': paymentTerms,
    };
  }
}
