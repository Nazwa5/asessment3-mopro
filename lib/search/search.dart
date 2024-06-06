import 'package:flutter/material.dart';
import 'package:assessment/MainPage/Home2.dart';
import '../search/dest.dart'; // Assuming you still need this import for other destinations
import '../search/desc.dart'; // Import the DetailScreen

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  void _navigateToDestination(BuildContext context, String title) {
    if (title == 'Danau Toba') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DestinationScreen(title: title),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: AppBar(),
      ),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home1(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        'Destinasi Wisata',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari destinasi',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Kami Menemukan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () => _navigateToDestination(context, 'Danau Toba'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/image/danau-toba.png',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            bottom: 14,
                            left: 12,
                            child: Text(
                              'Danau Toba',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Destinasi favorit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildDestinationCard(
                          'assets/image/danau-toba1.png', 'Danau Toba'),
                      _buildDestinationCard(
                          'assets/image/aek-sijorni.png', 'Aek Sijorni'),
                      _buildDestinationCard(
                          'assets/image/air-terjun-sipiso-piso.png',
                          'Air Terjun Sipiso-piso'),
                      _buildDestinationCard(
                          'assets/image/lumbini-natural-park.png',
                          'Lumbini Natural Park'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Destinasi lain',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildDestinationCard('assets/image/mr-al-mashun.png',
                          'Masjid Raya Al Mashun'),
                      _buildDestinationCard(
                          'assets/image/mikie-holiday.png', 'Mikie Holiday'),
                      _buildDestinationCard(
                          'assets/image/kebun-binatang-siantar.png',
                          'Kebun Binatang Siantar'),
                      _buildDestinationCard(
                          'assets/image/istana-mimun.png', 'Istana Mimun'),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () => _navigateToDestination(context, name),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: 290,
                height: 180,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 5,
                left: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
