import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/myHomePage.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

 final FirebaseAuth auth = FirebaseAuth.instance; 
 
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
       
      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential); 
      User user = result.user;
      
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(user)));
      } else{
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(user)));
      } // if result not null we simply call the MaterialpageRoute,
        // for go to the HomePage screen
    }
  }



  
    /*
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final  UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // ignore: deprecated_member_use
  final User currentUser = await _auth.currentUser;
  assert(currentUser.uid == user.uid);

  return user;
}
*/
void signOutGoogle() async {
  await googleSignIn.signOut();
}