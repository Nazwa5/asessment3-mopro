import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assessment/Maps/Maps.dart';
import 'package:assessment/search/search.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              builder: (context) => const Search(),
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
                    Positioned(
                      top: 40,
                      right: 16,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Danau Toba',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Simalungun',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text('4.8 (343)'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Danau Toba di Sumatera Utara, danau vulkanik terbesar di dunia, terbentuk 74,000 tahun lalu. Dengan luas 1145 km² dan Pulau Samosir di tengahnya, danau ini menawarkan pemandangan indah, budaya Batak Toba, serta beragam aktivitas wisata.',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 22,
                      right: 16,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapScreen(),
                            ),
                          );
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
                          backgroundColor:
                              const Color(0xFF6B6BF4), // Background color
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
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aktivitas di Danau Toba',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        activityCard('Jet ski', 'assets/image/image 2.png',
                            'Personal watercraft ini, istime...'),
                        activityCard(
                            'Kapal Penyeberangan',
                            'assets/image/image 3.png',
                            'Kapal pinisi ini adalah yang per...'),
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
                        'Destinasi favorit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        destinationCard(
                            'Danau Toba', 'assets/image/danau-toba1.png'),
                        destinationCard('Air Terjun Sipiso-piso',
                            'assets/image/air-terjun-sipiso-piso.png'),
                        destinationCard(
                            'Aek Sijorni', 'assets/image/aek-sijorni.png'),
                        destinationCard('Lumbini Natural Park',
                            'assets/image/lumbini-natural-park.png'),
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        souvenirCard('Kain Ulos', 'assets/image/image 6.png'),
                        souvenirCard(
                            'Aksesoris Khas', 'assets/image/image 7.png'),
                        souvenirCard('Souvenir 3', 'assets/image/image 8.png'),
                        souvenirCard('Souvenir 4', 'assets/image/image 9.png'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle help button
                    },
                    icon: const Icon(Icons.help),
                    label: const Text('Butuh Bantuan?'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 25),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget activityCard(String title, String imagePath, String description) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 10),
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
}
