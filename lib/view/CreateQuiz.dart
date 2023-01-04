import 'package:app_quiz/services/database.dart';
import 'package:app_quiz/view/addQuestion.dart';
import 'package:app_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
class CreateQuiz extends StatefulWidget {

  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formkey = GlobalKey<FormState>();

  late String urlImage,titredequiz,description ,quizId;
    DatabaseService databaseService=new DatabaseService();
    bool _isLoading = false;
  CreateQuizOnline() async{
    if(_formkey.currentState!.validate()){
      setState((){
        _isLoading = true;
      });
  quizId = randomAlphaNumeric(16);
  Map<String,String> quizMap = {
   "quizId" : quizId,
    "quizimageUrl":urlImage,
    "quizTitle":titredequiz,
    "quizDescription":description,

  };
    await databaseService.addQuizData(quizMap, quizId).then((value){
      setState((){
        _isLoading = false;
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context)=> AddQuestion(
              quizId
            )));
      });
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCBE7F5),
    // backgroundColor: Color(0xFFF7C6F1),
      appBar: AppBar(
        backgroundColor: Colors.blue,

          title: appBar(context),
        iconTheme: IconThemeData(color: Colors.pinkAccent),

      ),
      body:_isLoading? Container(
        child: Center(child: CircularProgressIndicator(),),
      ):Form(
        key: _formkey,

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24) ,
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter your image Url": null,
                decoration: InputDecoration(
                  hintText: "your Quiz image Url",
                ),
                onChanged: (val){
                  urlImage = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter your Title": null,
                decoration: InputDecoration(
                    hintText: "your Quiz TiTle",
                ),
                onChanged: (val){
                  titredequiz = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter your Description": null,
                decoration: InputDecoration(
                    hintText: "your Quiz Description",
                ),
                onChanged: (val){
                 description = val;
                },
              ),
              Spacer(),
              GestureDetector(
                onTap:()=>CreateQuizOnline(),
                  child: pinkButton(
                      context:context,
                      nomdubutton:"Create Quiz",
                  )),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ) ,
    );



  }
}
