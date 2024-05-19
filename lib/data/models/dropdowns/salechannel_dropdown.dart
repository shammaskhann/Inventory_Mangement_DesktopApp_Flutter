class SalesChannelDropDown {
  final int channelId;
  final String name;

  SalesChannelDropDown({
    required this.channelId,
    required this.name,
  });

  factory SalesChannelDropDown.fromJson(Map<String, dynamic> json) {
    return SalesChannelDropDown(
      channelId: json['ChannelID'],
      name: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ChannelID': channelId,
      'Name': name,
    };
  }
}
