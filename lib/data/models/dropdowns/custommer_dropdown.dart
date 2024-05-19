class CustomerDropDown {
  final int customerID;
  final String name;

  CustomerDropDown({required this.customerID, required this.name});

  factory CustomerDropDown.fromJson(Map<String, dynamic> json) {
    return CustomerDropDown(
      customerID: json['CustomerID'],
      name: json['Name'],
    );
  }
}
