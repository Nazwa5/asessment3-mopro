import 'package:assessment/destinasi/destinasi.dart';
import 'package:assessment/search/desc.dart';
import 'package:assessment/search/dest.dart';
import 'package:flutter/material.dart';
import 'package:assessment/profile/profile.dart';
import 'package:assessment/search/search.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  _Home1 createState() => _Home1();
}

class _Home1 extends State<Home1> {
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
        preferredSize: const Size.fromHeight(35.0),
        child: AppBar(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home navigation
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home1(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.map_sharp),
              title: const Text('Destinasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Destinasi(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle Settings navigation
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
            ),
          ],
        ),
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
                Stack(
                  children: [
                    Image.asset(
                      'assets/image/danau-toba.png',
                      width: double.infinity,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        'Danau Toba',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Search(),
                            ),
                          );
                        },
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
                    ),
                  ],
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
                const SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // belum beres codenya
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: const Color(0xFF554FFC),
        child: const Icon(
          Icons.headset_rounded,
          color: Colors.white,
        ),
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
