//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  Future<void> addQuizData(Map<String, dynamic>quizData  ,String quizId) async {
    FirebaseFirestore.instance.collection("Quiz").doc(quizId).set(quizData).catchError((e){
 print(e.toString());
    });

  }
  Future<void> addQuestionData(Map<String, dynamic>questionData  ,String quizId) async{
    FirebaseFirestore.instance.collection("Quiz").doc(quizId).collection("QNA").add(questionData).catchError((e){
      print(e.toString());
    }); }
    getAllQuizData() async{
      return await FirebaseFirestore.instance.collection("Quiz").snapshots();
      }
  getQuizData(String quizId) async{
    return await FirebaseFirestore.instance.collection("Quiz")
        .doc(quizId).collection("QNA").get();
  }
  }
