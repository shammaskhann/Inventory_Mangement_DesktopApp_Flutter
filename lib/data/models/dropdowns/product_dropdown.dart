class ProductDropDown {
  final int sku;
  final String name;

  ProductDropDown({required this.sku, required this.name});

  factory ProductDropDown.fromJson(Map<String, dynamic> json) {
    return ProductDropDown(
      sku: json['SKU'],
      name: json['Name'],
    );
  }
}
