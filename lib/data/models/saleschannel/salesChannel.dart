class SalesChannel {
  final int channelID;
  final String type;
  final String name;
  final String? location;
  final String contactDetails;
  final String operatingHours;

  SalesChannel({
    required this.channelID,
    required this.type,
    required this.name,
    this.location,
    required this.contactDetails,
    required this.operatingHours,
  });

  factory SalesChannel.fromJson(Map<String, dynamic> json) {
    return SalesChannel(
      channelID: json['ChannelID'],
      type: json['Type'],
      name: json['Name'],
      location: json['Location'],
      contactDetails: json['ContactDetails'],
      operatingHours: json['OperatingHours'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ChannelID': channelID,
      'Type': type,
      'Name': name,
      'Location': location,
      'ContactDetails': contactDetails,
      'OperatingHours': operatingHours,
    };
  }
}
