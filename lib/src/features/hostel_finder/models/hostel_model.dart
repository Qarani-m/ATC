class HostelModel {
  String? hostelId;
  String? reviewCount;
  String? name;
  String? priceForOne;
  String? priceForTwo;
  String? wifiStatus;
  String? location;
  String? type;
  String? beds;
  String? hotShowerStatus;
  String? waterStatus;
  String? contactInfo;
  String? mainImageUrl;

  // Constructor
  HostelModel({
    this.hostelId,
    this.reviewCount,
    this.name,
    this.priceForOne,
    this.priceForTwo,
    this.wifiStatus,
    this.location,
    this.type,
    this.beds,
    this.hotShowerStatus,
    this.waterStatus,
    this.contactInfo,
    this.mainImageUrl

  });

  // Convert HostelModel to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'hostelId': hostelId,
      'reviewCount': reviewCount,
      'name': name,
      'priceForOne': priceForOne,
      'priceForTwo': priceForTwo,
      'wifiStatus': wifiStatus,
      'location': location,
      'type': type,
      'beds': beds,
      'hotShowerStatus': hotShowerStatus,
      'waterStatus': waterStatus,
      'contactInfo': contactInfo,
      'mainImageUrl':mainImageUrl
    };
  }

  // Create a HostelModel from a Map (JSON)
  factory HostelModel.fromJson(Map<String, dynamic> json) {
    return HostelModel(
      hostelId: json['hostelId'],
      reviewCount: json['reviewCount'],
      name: json['name'],
      priceForOne: json['priceForOne'],
      priceForTwo: json['priceForTwo'],
      wifiStatus: json['wifiStatus'],
      location: json['location'],
      type: json['type'],
      beds: json['beds'],
      hotShowerStatus: json['hotShowerStatus'],
      waterStatus: json['waterStatus'],
      contactInfo: json['contactInfo'],
      mainImageUrl: json['mainImageUrl'],
      
    );
  }
}
