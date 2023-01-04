import 'package:flutter/material.dart';

import '../services/database.dart';
import '../widgets/widgets.dart';
class AddQuestion extends StatefulWidget {

  final String quizId;
  AddQuestion(this.quizId);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formkey = GlobalKey<FormState>();
  late String question,option1,option2,option3,option4;
  DatabaseService databaseService=new DatabaseService();
  bool _isLoading = false;
  UploadQuestionData() async{
    if(_formkey.currentState!.validate()){
      setState((){
        _isLoading = true;
      });
      Map<String,String> questionMap = {
        "question":question,
        "option1":option1,
        "option2":option2,
        "option3":option3,
        "option4":option4,
      };
     await databaseService.addQuestionData(questionMap, widget.quizId)
          .then((value){
       setState((){
         _isLoading = false;
       });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDAC8),
      // backgroundColor: Color(0xFFF7C6F1),
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.pinkAccent),

      ),
      body:  _isLoading?Container(
        child: Center(child: CircularProgressIndicator(),),
      ): Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24) ,
          child: Column(
            children: [SizedBox(height: 50,),
              TextFormField(

                validator: (val) => val!.isEmpty ? "Enter your Question": null,
                decoration: InputDecoration(
                  hintText: "your Question",
                ),
                onChanged: (val){
                  question = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter your correct answer": null,
                decoration: InputDecoration(
                  hintText: "Correct option",
                ),
                onChanged: (val){
                  option1 = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter your option2": null,
                decoration: InputDecoration(
                  hintText: "Option2",
                ),
                onChanged: (val){
                  option2 = val;
                }, ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Enter your option3": null,
                  decoration: InputDecoration(
                    hintText: "your Option3",
                  ),
                  onChanged: (val){
                    option3 = val;
                  },
                ),
          TextFormField(
            validator: (val) => val!.isEmpty ? "Enter your option4": null,
            decoration: InputDecoration(
              hintText: "your Option4",
            ),
            onChanged: (val){
              option4 = val;
            }, ),

              Spacer(),
              Row(
                children: [

                  GestureDetector(
                    onTap:() {Navigator.pop(context);},
                    child: pinkButton(
                        context: context,
                        nomdubutton: "submet",
                        widthbutton: MediaQuery.of(context).size.width/2-30),
                  ),
                  SizedBox(width: 13,),
                  GestureDetector(
                    onTap: (){
                      UploadQuestionData();
                    },
                    child: pinkButton(
                        context: context,
                        nomdubutton: "Add Question ",
                        widthbutton: MediaQuery.of(context).size.width/2-36),
                  ),
                ],

              ),
              SizedBox(height: 60,),
            ],

          ),
        ),
      ),
    );
  }
}
