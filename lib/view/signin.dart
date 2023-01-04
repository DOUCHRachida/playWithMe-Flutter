import 'package:app_quiz/helper/functions.dart';
import 'package:app_quiz/services/auth.dart';
import 'package:app_quiz/view/home.dart';
import 'package:app_quiz/view/signup.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'homeone.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late bool _isLoading = false;
  AuthServices authservice =new  AuthServices();
  signIn() async{
    if(_formKey.currentState!.validate ()) {
     setState((){
       _isLoading = true;
     });

 await authservice.signInEmailAndPass(email, password).then((val) {
   if (val != null){
     setState((){
       _isLoading = false;
     });

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOne()));
   }
 });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Color(0xFF7DBAD4),
      ),
      body: _isLoading? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ) ,
      ):Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Spacer(),
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
                signIn();
              },
              child:pinkButton(context:context,
                  nomdubutton:"Sign In",),
),

            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("Don't have an account ?",style: TextStyle(fontSize: 15.5),),
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignUp()
                      ));
                    },
                    child: Text("To Sign Up",style:
                    TextStyle(fontSize: 15.5,color:
                    Color(0xFF7DBAD4),fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
              ],
            ),
            const SizedBox(height: 80,),
              ],),
        ),
         ),
    );
  }
}
