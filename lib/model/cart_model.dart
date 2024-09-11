class Shoe {
  final String name;
  final double price;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String description;
  final String gender;
  final String brand;
  final List<String> colors;
  bool isFavorite;

  Shoe({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.description,
    required this.gender,
    required this.brand,
    required this.colors,
    this.isFavorite = false,
  });
}