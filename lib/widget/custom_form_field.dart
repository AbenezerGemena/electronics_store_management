import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final double height;
  final Icon prefixIcon;
  final bool obscureText;
  final RegExp validationRegExp;
  final void Function(String?)onSaved;

  CustomFormField({
  super.key,
  required this.hintText,
  required this.height ,
  required this.prefixIcon,
  required this.validationRegExp,
  this.obscureText = false,
  required this.onSaved,

 });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value){
          if(value != null && validationRegExp.hasMatch(value)){
            return null;
          }
          return "Enter a valid ${hintText.toLowerCase()}";
        },
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
         
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)
            ),
         
        ),
      ),

    );
  }
}