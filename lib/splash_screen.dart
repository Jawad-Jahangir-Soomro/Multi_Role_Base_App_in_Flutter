import 'dart:async';

import 'package:chapter_9/home_screen.dart';
import 'package:chapter_9/login_screen.dart';
import 'package:chapter_9/student_screen.dart';
import 'package:chapter_9/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogIn();

  }

  void isLogIn() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;

    if(isLogin){
      if(sp.get('roll') == 'Admin') {
        Timer(const Duration(seconds: 5),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        });
      }
      else if(sp.get('roll') == 'Teacher'){
        Timer(const Duration(seconds: 5),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TeacherScreen()));
        });
      }
      else if(sp.get('roll') == 'Student'){
        Timer(const Duration(seconds: 5),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentScreen()));
        });
      }
    }
    else{
      Timer(const Duration(seconds: 5),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const logInScreen()));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fill,
        image: NetworkImage("https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),
    );
  }
}
