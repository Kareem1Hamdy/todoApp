import 'package:flutter/material.dart';

showMessageDialog(BuildContext context,
    {
      required String message,
      bool isCancelable=true,
      required String textButtonMessage,
      required void Function() textButtonAction,
    }
    ){
     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
            content: Text(
                message,
              style: TextStyle(fontSize: 20),
            ),
             actions: [
               TextButton(
                   onPressed: textButtonAction,
                   child: Text(textButtonMessage),
               )
             ],

           );
         },
         barrierDismissible: isCancelable,
     );
}


showLoadingDialog(BuildContext context,
    {required String message,bool isCancelable=true}){
 showDialog(
     context: context,
     builder: (BuildContext context){
       return AlertDialog(
         content: Row(
           children: [
             CircularProgressIndicator(),
             SizedBox(width: 50,),
             Text(
                 message,
               style: TextStyle(
                 fontSize: 25
               ),
             )
           ],
         ),
       );
     },
     barrierDismissible: isCancelable,
 );

}

hideLoadingDialog(BuildContext context){
  Navigator.pop(context);
}