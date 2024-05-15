class TopSellingProductModel {
  int SKU;
  String productName;
  String vendorName;
  String category;
  int quantitySold;

  TopSellingProductModel(
      // ignore: non_constant_identifier_names
      {required this.SKU,
      required this.productName,
      required this.vendorName,
      required this.category,
      required this.quantitySold});
}
