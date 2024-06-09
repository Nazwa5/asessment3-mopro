import 'package:assessment/MainPage/Home1.dart';
import 'package:assessment/firebaseHelper/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic>? destination;

  Future<void> fetchData() async {
    var destinations =
        await DatabaseDestination().getDestinationDetail(widget.id);
    destination = destinations;
  }

  void _launchURL(String url) async {
    debugPrint(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    DatabaseDestination().addView(widget.id).then((value) {
      debugPrint('Success');
    });
  }

  Widget activityCard(String title, String imagePath) {
    return Container(
      width: 210,
      height: 160,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 27,
            right: 8,
            child: Icon(Icons.favorite_border, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget destinationCard(String title, String imagePath) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 8),
      child: Card(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget souvenirCard(String title, String imagePath) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 8),
      child: Card(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                ),
              ],
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, _) => Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/image/screen2.png',
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/image/danau-toba1.png',
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 40,
                              left: 16,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Home1(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    destination?['name'] ?? 'Loading',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    destination?['location'] ?? 'No Data',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.yellow),
                                      Text(
                                        '${destination?['rating'] ?? 'No Data'} (${destination?['totalReview'] ?? '0'})',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    destination?['description'] ?? 'No Data',
                                    style: const TextStyle(fontSize: 14),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 22,
                              right: 16,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _launchURL(
                                      destination?['mapUrl'] ?? 'No Data');
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                label: const Text(
                                  'Rute',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                      0xFF6B6BF4), // Background color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  textStyle: const TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aktivitas di ${destination?['name'] ?? 'Loading'}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                for (var activity
                                    in destination?['activities'] ?? [])
                                  activityCard(
                                    activity?['name'] ?? 'No Data',
                                    activity?['image'] ??
                                        'assets/image/image 1.png',
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Souvenir',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                for (var souvenir
                                    in destination?['souvenirs'] ?? [])
                                  souvenirCard(
                                    souvenir?['name'] ?? 'No Data',
                                    souvenir?['image'] ??
                                        'assets/image/image 1.png',
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
