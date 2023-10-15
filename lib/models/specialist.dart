class Specialist {
  final String name;
  final String domain;
  final String imageAssetPath; // The path to the specialist's image asset

  Specialist(
    this.name,
    this.domain,
    this.imageAssetPath,
  );
}

List<Specialist> specialistsList = [
  Specialist(
      'Kathryn Murphy','Hair Stylist','../assets/salon_images/femaleHairStylist.png'),
  Specialist("Esther Howard","Nail Artist","../assets/salon_images/femaleNailAtist.png"),
  Specialist("Kathryn Murphy","Hair Stylist","../assets/salon_images/maleHairStylist.jpg"),
  Specialist("Kathryn Murphy","Hair Stylist","../assets/salon_images/femaleHairStylist.png"),
  Specialist("Esther Howard","Nail Artist","../assets/salon_images/femaleNailAtist.png"),
  Specialist("Kathryn Murphy","Hair Stylist","../assets/salon_images/maleHairStylist.jpg"),
  // Add more services to the list
];