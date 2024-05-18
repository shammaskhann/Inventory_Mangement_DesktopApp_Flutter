class Customer {
  final int customerId;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final int? totalAmountSpent;

  Customer({
    required this.customerId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.totalAmountSpent,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['CustomerID'],
      name: json['Name'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      address: json['Address'],
      totalAmountSpent: json['TotalAmountSpent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerID': customerId,
      'Name': name,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Address': address,
      'TotalAmountSpent': totalAmountSpent,
    };
  }
}
