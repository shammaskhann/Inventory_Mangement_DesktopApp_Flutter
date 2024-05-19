class DiscountDropDown {
  final String discountCode;

  DiscountDropDown({required this.discountCode});

  factory DiscountDropDown.fromJson(Map<String, dynamic> json) {
    return DiscountDropDown(
      discountCode: json['DiscountCode'],
    );
  }
}
