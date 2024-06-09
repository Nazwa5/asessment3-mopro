import 'package:assessment/firebaseHelper/database.dart';
import 'package:flutter/material.dart';
import 'package:assessment/MainPage/Home1.dart'; // Assuming you still need this import for other destinations
import 'detailScreen.dart'; // Import the DetailScreen

class Search extends StatefulWidget {
  String search;
  Search({super.key, required this.search});

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  List listSearchDestination = [];
  List listPopularDestination = [];
  List listDestination = [];
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
    debugPrint(widget.search);
    if (widget.search.isNotEmpty) {
      var destinations = await DatabaseDestination().search(widget.search);
      listSearchDestination = destinations;
    }
    var destinations = await DatabaseDestination().getPopularDestination();
    listPopularDestination = destinations;
    var allDestinations = await DatabaseDestination().getDestination();
    listDestination = allDestinations;
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              onSubmitted: (value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Search(
                                      search: searchController.text,
                                    ),
                                  ),
                                )
                              },
                              controller: searchController,
                              decoration: const InputDecoration(
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var destination in listSearchDestination)
                                _buildDestinationCard(
                                    destination['image'] ??
                                        'assets/image/danau-toba.png',
                                    destination['name'] ?? 'Loading',
                                    destination['id'] ?? '0'),
                            ],
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
                              for (var destination in listPopularDestination)
                                _buildDestinationCard(
                                    destination['image'] ??
                                        'assets/image/danau-toba.png',
                                    destination['name'] ?? 'Loading',
                                    destination['id'] ?? '0'),
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
                                    destination['id'] ?? '0')
                            ],
                          ),
                        ),
                        const SizedBox(height: 45),
                      ],
                    ),
                  ),
                ],
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
