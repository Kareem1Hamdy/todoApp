import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dialogUtils/dialogUtils.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/provider/authProvider.dart';
import 'package:todo_app/registerScreen/register_screen.dart';

import '../Colors/app_colors.dart';
import '../Theme/app_Theme.dart';
import '../component/appFormField.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

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
                    titleTextField: 'E-mail address',
                    hintText: 'Enter your email address',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validate: (text){
                      if(text!.trim().isEmpty==true){
                        return 'Email Address must not be empty';
                      }
                      if(isValidEmail(text)==false){
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
                  Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: (){
                            login(context);
                          },
                          child: Text(
                            'Login',
                            style: AppTheme.lightThemeData.textTheme.titleLarge,
                          )
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: AppTheme.lightThemeData.textTheme.titleMedium,
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context)=> RegisterScreen(),
                            ),
                            );
                          },
                          child: Text(
                            'Create Account',
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

  login(BuildContext context){
    if(formKey.currentState!.validate()){
      loginToAccount(context);
    }
  }

  loginToAccount(BuildContext context)async{
    var loginProvider=Provider.of<AppAuthProvider>(context,listen: false);
    showLoadingDialog(
        context,
        message: 'Please Wait...'
    );
    try {
      final credential = await loginProvider.logInWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text,
      );
      hideLoadingDialog(context);
      showMessageDialog(
          context,
          message: 'Great! Login Successfully',
          textButtonMessage: "Let's Start Now",
          textButtonAction: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context)=>HomeScreen()));
          });
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';
      if (e.code == 'user-not-found'||e.code == 'wrong-password'||e.code=='invalid-credential') {
        message = 'Wrong Email Or Password';

        hideLoadingDialog(context);
        showMessageDialog(
            context,
            message: message,
            textButtonMessage: 'OK',
            textButtonAction: () {
              Navigator.pop(context);
            }
        );
      }
    }catch (e) {
      String message = 'Something went wrong';
      hideLoadingDialog(context);
      showMessageDialog(
          context,
          message: message,
          textButtonMessage: 'Try Again',
          textButtonAction: () {
            Navigator.pop(context);
            login(context);
          }
      );
    }
    }
  }
