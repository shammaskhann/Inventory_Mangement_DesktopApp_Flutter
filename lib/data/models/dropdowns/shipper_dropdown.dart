class ShipperDropDown {
  final int shipperID;
  final String shipperName;

  ShipperDropDown({required this.shipperID, required this.shipperName});

  factory ShipperDropDown.fromJson(Map<String, dynamic> json) {
    return ShipperDropDown(
      shipperID: json['ShipperID'],
      shipperName: json['ShipperName'],
    );
  }
}
