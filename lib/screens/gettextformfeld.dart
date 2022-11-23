
import 'package:flutter/material.dart';
import 'package:sqlitelogin/screens/comHelper.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
 String hintName;
 IconData icon;
 bool IsObscureText;
 TextInputType InputType;

  getTextFormField({
    required this.controller,
    required this.hintName,
    required this.icon,
    required this.IsObscureText,
     this.InputType=TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return  Container(

      padding: EdgeInsets.symmetric(horizontal:20 ),
      child: TextFormField(
        controller: controller ,
        obscureText :IsObscureText ,
        keyboardType:InputType  ,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintName';
          }
          if (hintName == "Email" && !validateEmail(value)) {
            return 'Please Enter Valid Email';
          }
          return null;
        },
        onSaved: (val)=>controller.text=val!,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          labelText:hintName ,
          hintText: hintName,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 2,color: Theme.of(context).primaryColor),
          ),
          focusColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
