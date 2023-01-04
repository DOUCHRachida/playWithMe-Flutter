import 'package:flutter/material.dart';

import 'homeone.dart';
class Result extends StatefulWidget {
 int score,totalQuestion,correct,incorrect;
  Result({required this.score,required this.totalQuestion,required this.correct,required this.incorrect});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting="";
  @override
  void initState() {
    super.initState();
    var percentage = (widget.score/(widget.totalQuestion*20))*100;
    if(percentage >= 90){
      greeting ="OutStanding";
    }else if(percentage >= 80 && percentage < 90){
      greeting ="Good Work";
    }else if(percentage >= 70 && percentage < 80){
      greeting ="Good Effort";
    }else if(percentage < 70){
      greeting ="Need Improvements";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children:<Widget> [
 Text("$greeting", style: TextStyle(fontSize: 25),),
          Text("Your score is ${widget.score} out of ${widget.totalQuestion*20}", style: TextStyle(fontSize: 25),),
      Text("CORRECT  ${widget.correct} ,INCORRECT ${widget.incorrect}", style: TextStyle(fontSize: 25),),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => HomeOne()
              ));;
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text("Go to home", style: TextStyle(color: Colors.white, fontSize: 19),),
            ),
          )
        ],
      ),
    ),

        ),
      );

  }
}
