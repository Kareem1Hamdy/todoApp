import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Colors/app_colors.dart';
import 'package:todo_app/Theme/app_Theme.dart';
import 'package:todo_app/component/appFormField.dart';
import 'package:todo_app/dialogUtils/dialogUtils.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/loginScreen/login_screen.dart';
import 'package:todo_app/provider/authProvider.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  static TextEditingController fullNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmationPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.primaryAppColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
              children: [
                Center(child: Image.asset('assets/images/Route_image_register.png')),
                const SizedBox(height: 15,),
                AppFormField(
                  titleTextField: 'Full Name',
                  hintText: 'Enter your full name',
                  controller: fullNameController,
                  validate: (text){
                    if(text!.trim().isEmpty==true){
                      return 'Full Name must not be empty';
                    }
                    if(text.length<6){
                      return 'Full Name must at least 6 char';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                AppFormField(
                  titleTextField: 'E-mail address',
                  hintText: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validate: (text){
                    if(text!.trim().isEmpty==true){
                      return 'Email address must not be empty';
                    }
                    if((isValidEmail(text))==false){
                      return 'Email address is not correct';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                AppFormField(
                  titleTextField: 'Password',
                  hintText: 'Enter your password',
                  keyboardType: TextInputType.visiblePassword,
                  showPasswordIcon: true,
                  obSecure: true,
                  controller: passwordController,
                  validate: (text){
                    if(text!.trim().isEmpty==true){
                      return 'Password must not be empty';
                    }
                    if(text.length<6){
                      return 'Password must at least 6 char';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                AppFormField(
                  titleTextField: 'Confirmation Password',
                  hintText: 'Enter your confirmation password',
                  keyboardType: TextInputType.visiblePassword,
                  showPasswordIcon: true,
                  obSecure: true,
                  controller: confirmationPasswordController,
                  validate: (text){
                    if(text!.trim().isEmpty==true){
                      return 'Password must not be empty';
                    }
                    if(passwordController.text!=text){
                      return 'The password is not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                        onPressed: (){
                        register(context);
                        },
                        child: Text(
                            'Sign up',
                        style: AppTheme.lightThemeData.textTheme.titleLarge,
                        )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Do you have account?',
                      style: AppTheme.lightThemeData.textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context)=> LoginScreen(),
                          ),
                          );
                        },
                        child: Text(
                            'Sign in',
                          style: AppTheme.lightThemeData.textTheme.titleMedium,
                        )
                    )
                  ],
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void register(BuildContext context){
    if(formKey.currentState!.validate()){
      createAccount(context);
  }
}

  createAccount(BuildContext context)async{
    var signUpProvider=Provider.of<AppAuthProvider>(context,listen: false);
    showLoadingDialog(
        context,
        message: 'Please Wait..',
        isCancelable: false,
    );
    try {
      final credential = await signUpProvider.signUpWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      hideLoadingDialog(context);
      showMessageDialog(
          context,
          message: 'Great! Sign Up Successfully',
          textButtonMessage:  "Let's Start Now",
          textButtonAction: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context)=>HomeScreen())
            );
          }
      );
    } on FirebaseAuthException catch (e) {
      String message='Something went wrong';
      if (e.code == 'weak-password') {
        message= 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message='The account already exists for that email.';
      }
      hideLoadingDialog(context);
      showMessageDialog(
          context,
          message: message,
          textButtonMessage: 'Ok',
          textButtonAction: (){
            Navigator.pop(context);
          }
      );
    } catch (e) {
      String message='Something went wrong';
      hideLoadingDialog(context);
      showMessageDialog(
          context,
          message: message,
          textButtonMessage: 'Try Again',
          textButtonAction: (){
            Navigator.pop(context);
            register(context);
          }
      );
    }
  }
}
