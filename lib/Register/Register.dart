import 'package:assessment/firebaseHelper/database.dart';
import 'package:assessment/login/login.dart';
import 'package:flutter/material.dart';
import 'package:assessment/MainPage/Home2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password tidak sama'),
        ),
      );
      return;
    }
    DatabaseUser().register(
      usernameController.text,
      passwordController.text,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username sudah digunakan'),
          ),
        );
      },
    );
  }

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
          Container(
            height: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 24.0, left: 24.0, bottom: 150.0),
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
                      controller: usernameController,
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
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                      controller: passwordController,
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
                    const SizedBox(height: 16),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Ulangi Password',
                        hintStyle: TextStyle(
                            color: Colors.grey[300],
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF554FFC),
                          padding: const EdgeInsets.symmetric(vertical: 26),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4.0), // Mengatur radius
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Koulen',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Already a member? Log in',
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
          )
        ],
      ),
    );
  }
}
