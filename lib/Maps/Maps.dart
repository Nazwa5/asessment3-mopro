import 'package:assessment/Maps/Rute.dart';
import 'package:assessment/search/desc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400, // Adjust the height as needed
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/image/north-sumatra.png',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Danau Toba',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Kab. Simalungun, Sumatera Utara',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RuteScreen(),
                                    ),
                                  );
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.route,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Rute',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0, // Ukuran teks
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0), // Padding
                                  textStyle: const TextStyle(fontSize: 16.0),
                                  backgroundColor: const Color(0xFF6B6BF4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RuteScreen(),
                                    ),
                                  );
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.bookmark,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Mulai',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0, // Ukuran teks
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0), // Padding
                                  textStyle: const TextStyle(fontSize: 16.0),
                                  backgroundColor: const Color(0xFF6B6BF4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.bookmark,
                                  size: 18.0,
                                  color: Color(0xFF6B6BF4),
                                ),
                                label: const Text(
                                  'Simpan',
                                  style: TextStyle(
                                    color: Color(0xFF6B6BF4),
                                    fontSize: 16.0, // Ukuran teks
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0), // Padding
                                  textStyle: const TextStyle(fontSize: 16.0),
                                  backgroundColor: Colors.grey[250],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildDestinationCard('assets/image/image 2.png'),
                          _buildDestinationCard('assets/image/image 3.png'),
                          _buildDestinationCard('assets/image/image 4.png'),
                          _buildDestinationCard('assets/image/image 5.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              imagePath,
              width: 290,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
