import 'package:chapter_9/home_screen.dart';
import 'package:chapter_9/student_screen.dart';
import 'package:chapter_9/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class logInScreen extends StatefulWidget {
  const logInScreen({Key? key}) : super(key: key);

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  String dropDownValue = 'Admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("LogInScreen")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration:const InputDecoration(
                hintText: "Email",
              )
            ),
            const SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
                decoration:const InputDecoration(
                  hintText: "Password",
                )
            ),
            const SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  hintText: "age",
                )
            ),
            const SizedBox(
              height: 20,
            ),

            DropdownButton(
              value: dropDownValue,
                items: <String>['Admin','Teacher','Student'].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue){
                setState(() {
                  dropDownValue = newValue!;
                });
                }
            ),

            Center(
              child: InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setBool('isLogin', true);
                  sp.setString('roll', dropDownValue.toString());
                  if(sp.get('roll') == 'Admin') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                  else if(sp.get('roll') == 'Teacher'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
                  }
                  else if(sp.get('roll') == 'Student'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
                  }
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                    border: Border.all(color: Colors.black, width: 5)
                  ),
                  child: const Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
