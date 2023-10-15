import 'package:flutter/material.dart';
import 'package:saloonapp/models/aboutus.dart';
import 'package:saloonapp/models/salon.dart';
import 'package:saloonapp/models/services.dart';
import 'package:saloonapp/models/specialist.dart';
import 'package:saloonapp/screens/specialistDetailScreen.dart';
import '../models/filter.dart';
import '../models/package.dart';
import '../models/review.dart';
import '../models/yourPhoto.dart';
import '../widgets/circle_icon.dart';

class DetailScreen extends StatelessWidget {
  final Salon salon;

  DetailScreen({required this.salon});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(
                children: [
                  Image.asset(
                    salon.imageAssetPath,
                    fit: BoxFit.cover,
                    width: 550,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Opacity(
                        opacity: 1.0,
                        child: Ink(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${salon.name}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ), // Star icon
                          Text(' ${salon.rating}', style: TextStyle(fontSize: 16)), // Rating
                        ],
                      ),
                      Text(' (${salon.numReviews}+ Reviews)', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Text(
                    '${salon.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('${salon.address}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer),
                    title: Text('${salon.time} . ${salon.distance} . ${salon.operatingHours}'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleIcon(
                          icon: Icons.language,
                          text: 'Website',
                        ),
                        CircleIcon(
                          icon: Icons.message,
                          text: 'Message',
                        ),
                        CircleIcon(
                          icon: Icons.phone,
                          text: 'Call',
                        ),
                        CircleIcon(
                          icon: Icons.directions,
                          text: 'Direction',
                        ),
                        CircleIcon(
                          icon: Icons.share,
                          text: 'Share',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(text: "Services"),
                Tab(text: "Specialist"),
                Tab(text: "Package"),
                Tab(text: "Gallery"),
                Tab(text: "Review"),
                Tab(text: "About Us"),
              ],
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ServicesTabContent(),
                  SpecialistTabContent(specialists: specialistsList),
                  PackageTabContent(),
                  GalleryTabContent(),
                  ReviewsTabContent(),
                  AboutUsTabContent()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SpecialistTabContent extends StatelessWidget {
  final List<Specialist> specialists; // Pass the list of specialists

  SpecialistTabContent({required this.specialists});

  @override
  Widget build(BuildContext context) {
    final blackColor = Colors.black; // Change this to your preferred black shade
    final redColor = Colors.red; // Change this to your preferred red shade

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        children: [
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Specialists ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
                  ),
                  TextSpan(
                    text: '(${specialists.length})',
                    style: TextStyle(fontWeight: FontWeight.bold, color: redColor),
                  ),
                ],
              ),
            ),
          ),
          // Specialist list with two specialists in each row
          for (int i = 0; i < specialists.length; i += 2)
            Row(
              children: [
                Expanded(
                  child: SpecialistCard(specialist: specialists[i]),
                ),
                if (i + 1 < specialists.length)
                  Expanded(
                    child: SpecialistCard(specialist: specialists[i + 1]),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class ServicesTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define your desired black and red colors
    final blackColor = Colors.black; // Change this to your preferred black shade
    final redColor = Colors.red; // Change this to your preferred red shade

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        children: [
          // Title with count in red and "Services" in black
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Services ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
                  ),
                  TextSpan(
                    text: '(${servicesList.length})',
                    style: TextStyle(fontWeight: FontWeight.bold, color: redColor),
                  ),
                ],
              ),
            ),
          ),
          // List of services
          ...servicesList.map((service) {
            return Card(
              elevation: 4, // Add a bit of elevation
              shadowColor: redColor, // Use the red color for the shadow
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Row(
                  children: [
                    Text(service.name),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Handle the click on the icon here
                        // You can navigate to a new page or show a dialog with the details
                      },
                      child: Row(
                        children: [
                          Text('${service.types} Types'),
                          InkWell(
                            onTap: () {
                              // Handle the click on the ">" character here
                              // You can navigate to a new page or show a dialog with the details
                            },
                            child: Text(' >', style: TextStyle(color: redColor, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class SpecialistCard extends StatelessWidget {
  final Specialist specialist;

  SpecialistCard({required this.specialist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecialistDetailScreen(specialist: specialist),
          ),
        );
      },
      child: Container(
        width: 150, // Set the desired width for each specialist card
        margin: EdgeInsets.all(8), // Add margin to create spacing
        child: Card(
          elevation: 4,
          shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(
                specialist.imageAssetPath,
                fit: BoxFit.cover,
                height: 150, // Set the desired height for the specialist image
              ),
              ListTile(
                title: Text(specialist.name),
                subtitle: Text(specialist.domain),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PackageTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define your desired black and red colors
    final blackColor = Colors.black; // Change this to your preferred black shade
    final redColor = Colors.red; // Change this to your preferred red shade

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        children: [
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Packages ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: blackColor, fontSize: 24),
                  ),
                  TextSpan(
                    text: '(${packagesList.length})',
                    style: TextStyle(fontWeight: FontWeight.bold, color: redColor, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          // List of packages
          ...packagesList.map((package) {
            return Card(
              elevation: 4, // Add a bit of elevation
              shadowColor: redColor, // Use the red color for the shadow
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        package.imageAssetPath,
                        fit: BoxFit.cover,
                        width: 100, // Set the desired width for the package image
                      ),
                      SizedBox(width: 8), // Add spacing between the image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              package.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('Discount icon', style: TextStyle(fontSize: 16)),
                            Text('Special Offers Package,', style: TextStyle(fontSize: 16)),
                            Text('Valid until ${package.validity}', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Leave two lines of space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '\$ ${package.price.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold, color: redColor, fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the "Book now" button click
                        },
                        child: Text('Book Now'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class GalleryTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blackColor = Colors.black; // Change this to your preferred black shade
    final redColor = Colors.red; // Change this to your preferred red shade

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Photos ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: blackColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: '(${yourPhotoList.length})',
                      style: TextStyle(fontWeight: FontWeight.bold, color: redColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            // Add a button to add more photos
            ElevatedButton.icon(
              onPressed: () {
                // Handle adding photos
              },
              icon: Icon(
                Icons.add,
                color: Colors.red, // Red color for the plus icon
              ),
              label: Text(
                'Add Photo',
                style: TextStyle(color: Colors.red), // Red color for the text
              ),
            ),
            SizedBox(height: 16), // Leave two lines of space
            // Display photos with the specified alignment
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two images per row
              ),
              itemBuilder: (context, index) {
                final photoUrl = yourPhotoList[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Image.network(
                    photoUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: yourPhotoList.length,
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blackColor = Colors.black; // Change this to your preferred black shade
    final redColor = Colors.red; // Change this to your preferred yellow shade

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add a button to add a review
            Row(
              children: [
                Text(
                  'Reviews',
                  style: TextStyle(fontWeight: FontWeight.bold, color: redColor, fontSize: 20),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle adding a review
                  },
                  style: ElevatedButton.styleFrom(primary: redColor),
                  child: Text('Add Review', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 16), // Leave two lines of space
            // Add a search bar with a search icon
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: blackColor),
                hintText: 'Search Reviews...',
              ),
            ),
            SizedBox(height: 16), // Leave two lines of space
            // Filter options in a row
            Row(
              children: [
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: blackColor),
                  onSelected: (value) {
                    // Handle filter selection
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'verified',
                        child: Text('Verified'),
                      ),
                      PopupMenuItem<String>(
                        value: 'latest',
                        child: Text('Latest'),
                      ),
                      PopupMenuItem<String>(
                        value: 'withPhotos',
                        child: Text('With Photos'),
                      ),
                      // Add more filter options here
                    ];
                  },
                ),
              ],
            ),
            SizedBox(height: 16), // Leave two lines of space
            // Display a list of reviews
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ReviewItem(review: review);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;

  ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    final greyColor = Colors.grey; // Change this to your preferred grey shade

    return Container(
      color: greyColor, // Set the background color to grey
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(review.profilePhoto),
                radius: 30,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(review.rating.toString()),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    review.date,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Followers: ${review.followersCount}',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            review.comment,
            style: TextStyle(color: Colors.black), // Change text color to black
          ),
        ],
      ),
    );
  }
}

class AboutUsTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blackColor = Colors.black; // Change this to your preferred black shade
    final greyColor = Colors.grey; // Change this to your preferred grey shade
    final redColor = Colors.red; // Change this to your preferred red shade

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: redColor),
            ),
            Text(descriptionDetails,
              style: TextStyle(color: blackColor),
            ),
            GestureDetector(
              onTap: () {
                // Handle the "Read More" link click
              },
              child: Text(
                'Read More',
                style: TextStyle(color: redColor),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Working Hours',
              style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
            ),
            Divider(
              color: greyColor,
            ),
            for (var day in workingHours.keys)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day,
                    style: TextStyle(color: blackColor),
                  ),
                  Text(
                    workingHours[day]!,
                    style: TextStyle(color: blackColor),
                  ),
                ],
              ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
            ),
            Divider(
              color: greyColor,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: blackColor,
                ),
                SizedBox(width: 8),
                Text(
                  '(406) 555-0120',
                  style: TextStyle(color: blackColor),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: blackColor,
                ),
                SizedBox(width: 8),
                Text(
                  'example@gmail.com',
                  style: TextStyle(color: blackColor),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: blackColor,
                ),
                SizedBox(width: 8),
                Text(
                  '8502 Preston Rd. Inglewood, Maine 98380',
                  style: TextStyle(color: blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "View on Map" click
                  },
                  child: Text(
                    'View on Map',
                    style: TextStyle(color: redColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Add the map here with the red current location pointer
            // You can use a Flutter map widget for this purpose
          ],
        ),
      ),
    );
  }
}
