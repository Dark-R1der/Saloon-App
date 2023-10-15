class Package {
  final String name;
  final String imageAssetPath;
  final String validity;
  final double price;

  Package({
    required this.name,
    required this.imageAssetPath,
    required this.validity,
    required this.price,
  });
}

List<Package> packagesList = [
  Package(
    name: "Hair Cutting & Hair Styling",
    imageAssetPath: "../assets/salon_images/HairCut.png",
    validity: "June 10, 2024",
    price: 125.00,
  ),
  Package(
    name: "Beauty Makeup",
    imageAssetPath: "../assets/salon_images/Makeup.png",
    validity: "June 10, 2024",
    price: 140.00,
  ),
  // Add more package items as needed
];

