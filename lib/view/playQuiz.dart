
import 'package:app_quiz/view/Resultat.dart';

import '../services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/QuestionModel.dart';
import '../widgets/quizPlayWidgets.dart';
import '../widgets/widgets.dart';


class QuizPlay extends StatefulWidget {
  late String quizId;
  @override
  _QuizPlayState createState() => _QuizPlayState();
  QuizPlay(this.quizId);
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;

/// Stream
Stream ?infoStream;

class _QuizPlayState extends State<QuizPlay> {
  QuerySnapshot? questionSnaphot;
  DatabaseService databaseService = new DatabaseService();

  bool isLoading = true;

  @override
  void initState() {
    databaseService.getQuizData(widget.quizId).then((value) {
      questionSnaphot = value;
      total = questionSnaphot!.docs.length;
      _correct = 0;
      _incorrect = 0;
      _notAttempted=questionSnaphot!.docs.length;
      isLoading = false;
      total = questionSnaphot!.docs.length;
      setState(() {});
      print("init don $total ${widget.quizId} ");
    });

    if(infoStream == null){
      infoStream = Stream<List<int>>.periodic(
          Duration(milliseconds: 100), (x){
        print("this is x $x");
        return [_correct, _incorrect] ;
      });
    }

    super.initState();
  }


  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.get("question");

    /// shuffling the options
    List<String> options = [
      questionSnapshot.get("option1"),
      questionSnapshot.get("option2"),
      questionSnapshot.get("option3"),
      questionSnapshot.get("option4"),
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot.get("option1");
    questionModel.answered = false;

    print(questionModel.correctOption.toLowerCase());

    return questionModel;
  }

  @override
  void dispose() {
    infoStream = null;
    super.dispose();
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
      body: isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InfoHeader(
                length: questionSnaphot!.docs.length,
              ),
              SizedBox(
                height: 10,
              ),
              questionSnaphot!.docs == null
                  ? Container(
                child: Center(child: Text("No Data"),),
              )
                  : ListView.builder(
                  itemCount: questionSnaphot!.docs.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return QuizPlayTile(
                      questionModel: getQuestionModelFromDatasnapshot(
                          questionSnaphot!.docs[index]),
                      index: index,
                    );
                  })
            ],
          ),

        ),

      ),
      floatingActionButton:FloatingActionButton(onPressed: ()
      { Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>Results(incorrect: _incorrect, total: total, correct: _correct, notattempted: _notAttempted))) ; },

      ),
    );
  }
}
class InfoHeader extends StatefulWidget {
  final int length;

  InfoHeader({required this.length});

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: infoStream,
        builder: (context, snapshot){
          return snapshot.hasData ? Container(
            height: 60,
            margin: EdgeInsets.only(left: 14),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                NoOfQuestionTile(
                  text: "Total",
                  number: widget.length,
                ),
                NoOfQuestionTile(
                  text: "Correct",
                  number: _correct,
                ),
                NoOfQuestionTile(
                  text: "Incorrect",
                  number: _incorrect,
                ),
                NoOfQuestionTile(
                  text: "NotAttempted",
                  number: _notAttempted,
                ),
              ],
            ),
          ) : Container();
        }
    );
  }
}


class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({required this.questionModel, required this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Text(
              "Q${widget.index + 1} ${widget.questionModel.question}",
              style:
              TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "A",
              description: "${widget.questionModel.option1}",
              correctAnswer: widget.questionModel.correctOption,
              SelectedOption: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "B",
              description: "${widget.questionModel.option2}",
              correctAnswer: widget.questionModel.correctOption,
              SelectedOption: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "C",
              description: "${widget.questionModel.option3}",
              correctAnswer: widget.questionModel.correctOption,
              SelectedOption: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "D",
              description: "${widget.questionModel.option4}",
              correctAnswer: widget.questionModel.correctOption,
              SelectedOption: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),

    );


  }
}


