import 'package:flutter/material.dart';

import '../Theme/app_Theme.dart';

typedef validateFunction= String? Function(String? text);

class AppFormField extends StatefulWidget {
   AppFormField({
     super.key,
     required this.titleTextField,
     required this.hintText,
     this.keyboardType=TextInputType.text,
     this.suffixIcon,
     this.showPasswordIcon=false,
     this.obSecure=false,
     required this.controller,
     required this.validate,
   });

  String titleTextField;
  String hintText;
  TextInputType keyboardType;
  Icon? suffixIcon;
  bool obSecure;
  bool showPasswordIcon;
  TextEditingController controller;
  validateFunction validate;


  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleTextField,
          style: AppTheme.lightThemeData.textTheme.titleMedium,
        ),
        const SizedBox(height: 15,),
        TextFormField(
          keyboardType: widget.keyboardType,
          obscureText: widget.obSecure,
          validator: widget.validate,
          controller: widget.controller,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.showPasswordIcon?GestureDetector(
              onTap: (){
                setState(() {
                  widget.obSecure=!widget.obSecure;
                });
              },
                child: widget.obSecure?
              Icon(Icons.visibility_off):
              Icon(Icons.visibility),
            ):null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Colors.white
                )
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
