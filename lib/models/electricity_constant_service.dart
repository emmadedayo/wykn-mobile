class ElectricityConstantService {
  final String name;
  final String slug;

  ElectricityConstantService({
    required this.name,
    required this.slug,
  });

  // Convert a ElectricityConstantService object to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
    };
  }

  // Create a ElectricityConstantService object from a JSON map
  factory ElectricityConstantService.fromJson(Map<String, dynamic> json) {
    return ElectricityConstantService(
      name: json['name'],
      slug: json['slug'],
    );
  }
}
