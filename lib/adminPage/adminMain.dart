import 'package:assessment/MainPage/Home1.dart';
import 'package:assessment/adminPage/detailScreen.dart';
import 'package:assessment/createDestination/createDestination.dart';
import 'package:assessment/destinasi/destinasi.dart';
import 'package:assessment/firebaseHelper/database.dart';
import 'package:assessment/login/login.dart';
import 'package:flutter/material.dart';
import 'package:assessment/profile/profile.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreen createState() => _AdminHomeScreen();
}

class _AdminHomeScreen extends State<AdminHomeScreen> {
  List listDestination = [];

  void _navigateToDestination(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminDetailScreen(
          id: id,
        ),
      ),
    );
  }

  // Logic untuk mengambil data dari firebase
  Future<void> fetchData() async {
    var destinations = await DatabaseDestination().getDestination();
    listDestination = destinations;
  }

  // Inisialisasi data ketika pertama kali dijalankan
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold untuk menampilkan halaman dan Future untuk mengambil data dari firebase yang bersifat asyncronus
    return FutureBuilder(
        future: fetchData(),
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                title: const Text('Admin Destinasi'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
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
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: listDestination.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _buildDestinationCard(
                                      listDestination[index]['image'] ??
                                          'assets/image/danau-toba1.png',
                                      listDestination[index]['name'],
                                      listDestination[index]['id']),
                                  const SizedBox(height: 12),
                                ],
                              );
                            },
                          ),
                        ),
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
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateDestinationScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
            ));
  }

  Widget _buildDestinationCard(
    String imagePath,
    String name,
    String id,
  ) {
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
                width: double.infinity,
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
