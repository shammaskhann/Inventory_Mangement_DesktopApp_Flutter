class Product {
  final int productID;
  final String product;
  final int quantityAvailable;
  final double price;
  final String productStatus;
  final String supplierName;
  final int reorderLevel;
  final String category;

  Product({
    required this.productID,
    required this.product,
    required this.quantityAvailable,
    required this.price,
    required this.productStatus,
    required this.supplierName,
    required this.reorderLevel,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: json['ProductID'],
      product: json['Product'],
      quantityAvailable: json['QuantityAvailable'],
      price: json['Price'],
      productStatus: json['ProductStatus'],
      supplierName: json['SupplierName'],
      reorderLevel: json['ReorderLevel'],
      category: json['Category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductID': productID,
      'Product': product,
      'QuantityAvailable': quantityAvailable,
      'Price': price,
      'ProductStatus': productStatus,
      'SupplierName': supplierName,
      'ReorderLevel': reorderLevel,
      'Category': category,
    };
  }
}
