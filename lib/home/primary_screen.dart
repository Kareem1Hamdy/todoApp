import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Colors/app_colors.dart';
import 'package:todo_app/Theme/app_Theme.dart';
import 'package:todo_app/loginScreen/login_screen.dart';
import 'package:todo_app/provider/authProvider.dart';
import '../component/taskprimaryscreeninfo.dart';

class PrimaryScreen extends StatelessWidget {
   PrimaryScreen({super.key});

   var size,height,width;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppAuthProvider>(context);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: AppColors.primary2AppColor,
      body: Column(
        children: [
          Container(
            height: height*0.2,
            width: double.infinity,
            color: AppColors.primaryTopColor,
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'To Do List',
                  style: AppTheme.lightThemeData.textTheme.bodyLarge,
                ),
                //SizedBox(width: 20,),
               // Expanded(child: Text(
                  //  '${RegisterScreen.fullNameController.text}',
                  //style: TextStyle(
                  //  fontSize: 20,
                  //  color: Colors.white
                 // ),
                //)
                //),
                GestureDetector(
                  onTap: (){
                      provider.logout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)=>LoginScreen())
                      );
                  },
                  child: Icon(
                      Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index)=>TaskInfo(),
                separatorBuilder: (context,index)=>const SizedBox(height: 5,),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
