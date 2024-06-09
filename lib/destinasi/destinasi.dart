import 'package:assessment/firebaseHelper/database.dart';
import 'package:assessment/search/detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:assessment/MainPage/Home1.dart';

class Destinasi extends StatefulWidget {
  const Destinasi({Key? key}) : super(key: key);

  @override
  _Destinasi createState() => _Destinasi();
}

class _Destinasi extends State<Destinasi> {
  List popularDestination = [];
  TextEditingController searchController = TextEditingController();

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
    var popularDestinations =
        await DatabaseDestination().getPopularDestination();
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
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/image/screen2.png',
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
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
                          const SizedBox(height: 40),
                          TextField(
                            onSubmitted: (value) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    id: searchController.text,
                                  ),
                                ),
                              );
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Cari destinasi',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            'Pencarian terbaru anda',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          const SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailScreen(id: '1'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(130, 50),
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  child: const Text('Danau Toba \nSimalungun'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Aksi pencarian terbaru 2
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(130, 50),
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  child:
                                      const Text('Gunung Sibayak \nBerastagi'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Aksi pencarian terbaru 3
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(130, 50),
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  child: const Text('Istana Maimun \nMedan'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            'Tujuan yang paling banyak dikunjungi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          // const SizedBox(height: 5),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: popularDestination.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Stack(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _navigateToDestination(
                                            context,
                                            popularDestination[index]['id'] ??
                                                '0');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 150),
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      child: Image.asset(
                                        popularDestination[index]['image'] ??
                                            'assets/image/danau-toba.png',
                                        width: double.infinity,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          popularDestination[index]['name'] ??
                                              'Loading',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
