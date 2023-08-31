class ElectricityModel {
  final String customerId;
  final String name;
  final String productCode;

  ElectricityModel({
    required this.customerId,
    required this.name,
    required this.productCode,
  });

  factory ElectricityModel.fromJson(Map<String, dynamic> json) {
    return ElectricityModel(
      customerId: json['customerId'],
      name: json['name'],
      productCode: json['productCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'name': name,
      'productCode': productCode,
    };
  }
}
