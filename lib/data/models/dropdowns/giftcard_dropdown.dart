class GiftCardDropDown {
  final int giftCardNumber;

  GiftCardDropDown({required this.giftCardNumber});

  factory GiftCardDropDown.fromJson(Map<String, dynamic> json) {
    return GiftCardDropDown(
      giftCardNumber: json['GiftCardNumber'],
    );
  }
}
