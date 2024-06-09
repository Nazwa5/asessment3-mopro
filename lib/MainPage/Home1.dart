import 'package:assessment/destinasi/destinasi.dart';
import 'package:assessment/firebaseHelper/database.dart';
import 'package:assessment/search/detailScreen.dart';
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
  List listDestination = [];
  List popularDestination = [];

  void _navigateToDestination(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(id: id),
      ),
    );
  }

  // Logic untuk mengambil data dari firebase
  Future<void> fetchData() async {
    var destinations = await DatabaseDestination().getDestination();
    var popularDestinations =
        await DatabaseDestination().getPopularDestination();
    listDestination = destinations;
    popularDestination = popularDestinations;
  }

  // Inisialisasi data ketika pertama kali dijalankan
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, _) => Scaffold(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
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
                              for (var destination in popularDestination)
                                _buildDestinationCard(
                                  destination['image'] ??
                                      'assets/image/danau-toba.png',
                                  destination['name'] ?? 'Loading',
                                  destination['id'] ?? 'Loading',
                                ),
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
                              for (var destination in listDestination)
                                _buildDestinationCard(
                                  destination['image'] ??
                                      'assets/image/danau-toba.png',
                                  destination['name'] ?? 'Loading',
                                  destination['id'] ?? 'Loading',
                                ),
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
            ));
  }

  Widget _buildDestinationCard(String imagePath, String name, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () => _navigateToDestination(context, id),
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
