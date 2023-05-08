import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  String email = '', age = '' , roll = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    roll = sp.getString('roll') ?? '';

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Student Screen")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email"),
                Text(email),
              ],
            ),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("age"),
                Text(age),
              ],
            ),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("roll"),
                Text(roll),
              ],
            ),
            const SizedBox(height: 30,),


            Center(
              child: InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  Navigator.push(context, MaterialPageRoute(builder: (context) => logInScreen()));

                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 5)
                  ),
                  child: const Center(child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 40),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
