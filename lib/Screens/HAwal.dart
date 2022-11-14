import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_1/Screens/HLogin.dart';
import 'package:uas_1/Screens/HUtama.dart';
import 'package:uas_1/Screens/HProfile.dart';
import 'package:uas_1/Screens/auth_service.dart';

class HAwal extends StatefulWidget {
  const HAwal({super.key});

  @override
  State<HAwal> createState() => _HAwalState();
}

class _HAwalState extends State<HAwal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black12,
              Colors.black87,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(24, 100, 128, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Discover Your Own Keychain!',
                            textAlign: TextAlign.start,
                            textStyle: const TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 300),
                          ),
                        ],
                        totalRepeatCount: 2,
                        pause: const Duration(milliseconds: 50),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ],
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            AuthService().signInWithGoogle();

                            print('Masuk Login');
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightGreen),
                          ),
                          icon: Icon(Icons.login),
                          label: Text('Login')),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HUtama(),
                                ));
                            ;
                            print('Masuk Registrasi');
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightGreen),
                          ),
                          icon: Icon(Icons.app_registration),
                          label: Text('Create New Account')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
