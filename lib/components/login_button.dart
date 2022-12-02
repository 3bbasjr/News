import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {
  final double width;
  final     Color  background;
  final VoidCallback   function  ;
  final  String text;
      LoginButton({
   required this.function,
   required this.background,
   required this.text,
   required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed:
          function
        ,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
