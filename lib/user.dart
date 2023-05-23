import 'package:flutter/material.dart';
import 'user_model.dart';
import 'fetch.dart';
import 'paint.dart';
import 'productView.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: RPSCustomPainter(),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "PHOTONISM",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 175, 1, 113),
                                  letterSpacing: 1.0),
                            ),
                            TextField(
                              controller: username,
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 175, 1, 113),
                                      fontSize: 12)),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: password,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 175, 1, 113),
                                      fontSize: 12)),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: (!_loading)
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 175, 1, 113),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 8),
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      child: const Text('Login'),
                                      onPressed: () {
                                        setState(() => _loading = true);
                                        PostController.login(
                                                username: username.text,
                                                password: password.text)
                                            .then((value) {
                                          setState(() => _loading = false);
                                          if (value.token != null) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProdukView(
                                                          user: value,
                                                        )));
                                          }
                                        });
                                      })
                                  : CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
