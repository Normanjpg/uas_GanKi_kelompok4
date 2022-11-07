import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'auth_service.dart';

class HLogin extends StatefulWidget {
  const HLogin({super.key});

  @override
  State<HLogin> createState() => _HLoginState();
}

class _HLoginState extends State<HLogin> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //sudah tidak dipakai
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: size.height * 0.2,
            bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Hello, \nGoogle sign in",
                style: TextStyle(fontSize: 30)),
            GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogle();
                },
                child: const Image(
                    width: 50, image: AssetImage('assets/google.png'))),
          ],
        ),
      ),
    );
  }
}
