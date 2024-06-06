import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assessment/Maps/Maps.dart';

class RuteScreen extends StatefulWidget {
  const RuteScreen({Key? key}) : super(key: key);

  @override
  _RuteScreen createState() => _RuteScreen();
}

class _RuteScreen extends State<RuteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/image/peta-jalan1.png',
              height: 540,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 5.0,
            right: 16.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mengemudi',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '10 menit (5Km)',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.car, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text('10 mnt',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(width: 16.0),
                      FaIcon(FontAwesomeIcons.motorcycle, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text('7 mnt',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.locationArrow,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Mulai',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0), // Padding
                          textStyle: const TextStyle(fontSize: 16.0),
                          backgroundColor: const Color(0xFF6B6BF4),
                        ),
                      ),
                      const SizedBox(width: 10),
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
                              horizontal: 16.0, vertical: 8.0), // Padding
                          textStyle: const TextStyle(fontSize: 16.0),
                          backgroundColor: Colors.grey[250],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Latar belakang bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
