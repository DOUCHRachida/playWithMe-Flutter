import 'package:app_quiz/services/database.dart';
import 'package:app_quiz/view/CreateQuiz.dart';
import 'package:app_quiz/view/homeone.dart';
import 'package:app_quiz/view/playQuiz.dart';
import 'package:app_quiz/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Stream<QuerySnapshot> ?quizStream;
  DatabaseService databaseService=new DatabaseService();
  Widget QuizList(){
return Container(
  margin: EdgeInsets.symmetric(horizontal: 25),
  child: StreamBuilder<QuerySnapshot>(
     stream: quizStream,
    builder: (context,snapshot) {
      return snapshot.data == null
          ? Container():
            ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
return QuizTitle(
    UrlImage: snapshot.data!.docs[index].get('quizimageUrl'),
    title: snapshot.data!.docs[index].get('quizTitle'),
    description: snapshot.data!.docs[index].get('quizDescription'),
  quizId: snapshot.data!.docs[index].get('quizId'),
);
                });
  },
  ),
);
  }
  void initState(){
    databaseService.getAllQuizData().then((val){
 setState((){
quizStream=val;
 });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7C6F1),
      appBar: AppBar(
        title: appBar(context),
      iconTheme: IconThemeData(color: Colors.pinkAccent),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => HomeOne()
          ),),
        ),

        //  backgroundColor: Colors.transparent,
      ),
      body: QuizList(

      ),
 floatingActionButton: FloatingActionButton(
   onPressed: () { 
     Navigator.push(context, MaterialPageRoute(
         builder: (context) =>CreateQuiz()));
   },
   child: Icon(Icons.add),

    ),
      );
  }
}
class QuizTitle extends StatelessWidget {
  late final String UrlImage;
  late final String title;
  late final String description;
  late final String quizId;
  QuizTitle({required this.UrlImage,required this.title,required this.description,required this.quizId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPlay(
          quizId
        )));
      },
      child: Container(margin: EdgeInsets.all(4 ),

        height: 150,
        child: Stack(
          children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.network(UrlImage,width: MediaQuery.of(context).size.width-48,fit: BoxFit.cover,)),
            Container(

              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,),),
                  SizedBox(height: 6,),
                  Text(description,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600,),),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
