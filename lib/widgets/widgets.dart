import 'package:flutter/material.dart';
Widget appBar(BuildContext context){
  return RichText(
      text: const TextSpan(

      style: TextStyle(fontSize: 24),
  children:  <TextSpan>[
  TextSpan(text: '                Play',
    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent),
      ),
    TextSpan(text: 'WithMe', style: TextStyle(fontWeight: FontWeight.bold)),
  ],
  ),

  );
}
Widget pinkButton({ required BuildContext context,required String nomdubutton,widthbutton}){
  return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
  decoration: BoxDecoration(
  color: Colors.pinkAccent,
  borderRadius: BorderRadius.circular(30)
  ),

  alignment: Alignment.center,
  width: widthbutton != null? widthbutton:MediaQuery.of(context).size.width - 48,
  child: Text(nomdubutton, style: TextStyle(color: Colors.white,fontSize: 16),
  ),);
}
