
import 'package:app_quiz/view/home.dart';
import 'package:app_quiz/view/playQuiz.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'hometwo.dart';
class HomeOne extends StatefulWidget {
  const HomeOne({Key? key}) : super(key: key);

  @override
  State<HomeOne> createState() => _HomeOneState();

}

class _HomeOneState extends State<HomeOne> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7C6F1),
      appBar: AppBar(
        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        //  backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Hometwo()
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 54),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24)
                ),
                child:
                Text("Start Quiz ", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
                ),

              ),),
            SizedBox(height: 24,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Home()
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 54),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24)
                ),
                child:
                Text("Create your Quiz ", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),

            ),

            )
          ],
        ),
      ),


    );
  }
}
