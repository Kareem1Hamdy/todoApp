import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AppAuthProvider extends ChangeNotifier{
  User? firebaseUser;

  AppAuthProvider(){
    firebaseUser= FirebaseAuth.instance.currentUser;
  }

  void login(User newUser){
    firebaseUser=newUser;
  }
  void logout(){
    firebaseUser=null;
    FirebaseAuth.instance.signOut();
  }

  bool isLoggedIn(){
    return firebaseUser!=null;
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password})async{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
    if(credential.user!=null){
      login(credential.user!);
    }
    return credential;
  }

  Future<UserCredential> logInWithEmailAndPassword(
      {required String email,required String password})async{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if(credential.user!=null){
      login(credential.user!);
    }
    return credential;
  }

}