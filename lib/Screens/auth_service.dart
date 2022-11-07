import 'package:flutter/cupertino.dart';
import 'package:uas_1/Screens/HAwal.dart';
import 'package:uas_1/Screens/HLogin.dart';
import 'package:uas_1/Screens/HUtama.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uas_1/Screens/Hcoba.dart';

class AuthService {
  // 1. handleAuthState()

  // 2. signInWithGoogle()

  // 3. signOut()
  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return CProfile();
          } else {
            return const HAwal();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
