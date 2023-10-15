class Review {
  final String profilePhoto;
  final String name;
  final int rating;
  final double followersCount;
  final String date;
  final String comment;

  Review({
    required this.profilePhoto,
    required this.name,
    required this.rating,
    required this.followersCount,
    required this.date,
    required this.comment,
  });
}

// Sample list of reviews (you can replace this with your data)
final List<Review> reviews = [
  Review(
    profilePhoto: '../assets/salon_images/profile/img.png',
    name: 'Dale Thiel',
    rating: 5,
    followersCount: 45,
    date: 'Oct 15, 2023',
    comment: 'Great experience! Highly recommended.',
  ),
  Review(
    profilePhoto: '../assets/salon_images/profile/img.png',
    name: 'Tiffany Nitzsche',
    rating: 5,
    followersCount: 1.5 ,
    date: 'Oct 15, 2023',
    comment: 'Value for money ! Highly recommended.',
  )
  // Add more reviews here
];