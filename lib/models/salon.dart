class Salon {
  final String name;
  final String description;
  final String imageAssetPath;
  final String address;
  final String time; // Add a field for time
  final String distance; // Add a field for distance
  final String operatingHours; // Add a field for operating hours
  final String rating;
  final String numReviews;

  Salon({
    required this.name,
    required this.description,
    required this.imageAssetPath,
    required this.address,
    required this.time,
    required this.distance,
    required this.operatingHours,
    required this.rating,
    required this.numReviews
  });
}

final List<Salon> salons = [
  Salon(
      name: 'Galmour Haven',
      description: 'Haircuts, Make Up, Shaving',
      imageAssetPath: '../assets/salon_images/salon_main.jpeg',
      address: '8501 Preston Rd, Inglewood, Maine 98380',
      time: '15 min',
      distance: '1.5km',
      operatingHours: 'Mon Sun | 11 am - 11 pm',
      rating: '4.8',
      numReviews: '1k'
  ),
  // Add more Salon objects here with time, distance, and operatingHours
];
