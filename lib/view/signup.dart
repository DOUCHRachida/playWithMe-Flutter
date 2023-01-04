import 'package:app_quiz/view/signin.dart';
import 'package:app_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../helper/functions.dart';
import '../services/auth.dart';
import 'home.dart';
import 'homeone.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password,name;
  late bool _isLoading = false;
  AuthServices authservice =new  AuthServices();
  signUp() async{
    if(_formKey.currentState!.validate ()) {
      setState((){
        _isLoading = true;
      });
       authservice.signUpWithEmailAndPassword(email, password).then((value) { if (value != null){
        setState((){
          _isLoading = false;
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOne()));
      }

      });
      }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Color(0xFF7DBAD4),
      ),
      body: _isLoading? Container(
        child: Center(
          child: CircularProgressIndicator(),)
      ):Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Spacer(),
            TextFormField(
              validator: (val){ return val!.isEmpty ? "enter your  name" : null;},
              decoration: const InputDecoration(
                  hintText: "your name"
              ),
              onChanged: (val){
                name = val;
              },
            ),
            TextFormField(
              validator: (val){ return val!.isEmpty ? "enter your  email" : null;},
              decoration: const InputDecoration(
                  hintText: "enter your email"
              ),
              onChanged: (val){
                email = val;
              },
            ),
            SizedBox(height: 6,),
            TextFormField(
              obscureText: true,
              validator: (val){ return val!.isEmpty ? "enter your  password" : null;},
              decoration: const InputDecoration(
                  hintText: "enter your password"
              ),
              onChanged: (val){
                password = val;
              },
            ),
            SizedBox(height: 24,),
            GestureDetector(
              onTap: (){
                signUp();
              },
              child: pinkButton(context:context,
                  nomdubutton:"Sign Up", ),
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(" Already have an account ?",style: TextStyle(fontSize: 15.5),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignIn()
                    ));
                  },
                    child: Text("To Sign in",style: TextStyle(fontSize: 15.5,color: Color(0xFF7DBAD4),fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
              ],
            ),
            const SizedBox(height: 80,),
          ],),
        ),
      ),
    );
  }
}
