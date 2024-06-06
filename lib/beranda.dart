import 'package:flutter/material.dart';
import 'package:assessment/login/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: AppBar(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image/screen2.png', // Path to your background image
            fit: BoxFit.cover, // Menyesuaikan gambar dengan seluruh layar
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 93),
                  Image.asset(
                    'assets/image/image.png',
                    width: 145,
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 28),
                      const Text(
                        'SUMUT',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Koulen',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -5), // Menggeser teks ke atas
                        child: const Text(
                          'ADVENTURE',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Koulen',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: 145,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF554FFC), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 52, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(4.0), // Mengatur radius
                    ),
                  ),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Koulen',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
