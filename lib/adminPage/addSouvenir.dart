import 'package:assessment/adminPage/adminMain.dart';
import 'package:assessment/firebaseHelper/database.dart';
import 'package:flutter/material.dart';

class AddSouvenirScreen extends StatefulWidget {
  final String id;
  const AddSouvenirScreen({super.key, required this.id});

  @override
  State<AddSouvenirScreen> createState() => _AddSouvenirScreenState();
}

class _AddSouvenirScreenState extends State<AddSouvenirScreen> {
  final TextEditingController nameController = TextEditingController();

  Map<String, dynamic>? destination;

  addSouvenir() async {
    await DatabaseDestination().addSouvenirs(widget.id, nameController.text,
        () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AdminHomeScreen();
      }));
    }, () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add activities'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Tambah Sovuenir ${destination?['name'] ?? ''}')),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addSouvenir,
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
            ],
          ),
        ),
      ]),
    );
  }
}
