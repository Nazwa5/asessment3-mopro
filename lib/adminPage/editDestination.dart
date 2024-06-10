import 'package:assessment/adminPage/adminMain.dart';
import 'package:assessment/firebaseHelper/database.dart';
import 'package:flutter/material.dart';

class EditDestinationScreen extends StatefulWidget {
  final String id;
  const EditDestinationScreen({super.key, required this.id});

  @override
  State<EditDestinationScreen> createState() => _EditDestinationScreenState();
}

class _EditDestinationScreenState extends State<EditDestinationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController totalReviewController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  Map<String, dynamic>? destination;
  Future<void> fetchData() async {
    var destinations =
        await DatabaseDestination().getDestinationDetail(widget.id);
    destination = destinations;
    nameController.text = destination?['name'] ?? '';
    locationController.text = destination?['location'] ?? '';
    ratingController.text = destination?['rating'] ?? '';
    descriptionController.text = destination?['description'] ?? '';
    totalReviewController.text = destination?['totalReview'] ?? '';
    urlController.text = destination?['mapUrl'] ?? '';
  }

  update() async {
    await DatabaseDestination().updateDestination(
        widget.id,
        nameController.text,
        locationController.text,
        descriptionController.text,
        ratingController.text,
        totalReviewController.text,
        urlController.text, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AdminHomeScreen();
      }));
    }, () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update destination'),
        ),
      );
    });
  }

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
        appBar: AppBar(title: Text('Edit ${destination?['name'] ?? ''}')),
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assets/image/screen2.png', // Path to your background image
            fit: BoxFit.cover, // Menyesuaikan gambar dengan seluruh layar
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24.0), // Tambahkan padding di sini
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Lokasi',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    labelText: 'Link Google Maps',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: ratingController,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: totalReviewController,
                  decoration: InputDecoration(
                    labelText: 'Total Review',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    hintStyle: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: update,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF554FFC),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4.0), // Mengatur radius
                      ),
                    ),
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Koulen',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
