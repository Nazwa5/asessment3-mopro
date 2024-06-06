import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assessment/MainPage/Home.dart';
import 'package:assessment/MainPage/Home2.dart';
import 'package:assessment/Register/Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: AppBar(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image/screen2.png', // Path to your background image
            fit: BoxFit.cover, // Menyesuaikan gambar dengan seluruh layar
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0), // Tambahkan padding di sini
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SELAMAT DATANG DI',
                    style: TextStyle(
                      fontFamily: 'Koulen',
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF271CA5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'SUMUT ADVENTURE',
                    style: TextStyle(
                      fontFamily: 'Koulen',
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF271CA5),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
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
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey[300],
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // Tambahkan aksi untuk lupa password
                      },
                      child: const Text(
                        'Lupa password?',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home1(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF554FFC),
                        padding: const EdgeInsets.symmetric(vertical: 26),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4.0), // Mengatur radius
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Or login with',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        color: Colors.red,
                        iconSize: 30,
                        onPressed: () {
                          // Tambahkan aksi untuk login dengan Google
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        color: Colors.blue,
                        iconSize: 30,
                        onPressed: () {
                          // Tambahkan aksi untuk login dengan Facebook
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 95),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Not a member? Sign in',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
