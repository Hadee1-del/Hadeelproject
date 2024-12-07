import 'package:flutter/material.dart';

class MyClassHadeel extends StatefulWidget {
  const MyClassHadeel({super.key});

  @override
  State<MyClassHadeel> createState() => _MyClassHadeelState();
}

class _MyClassHadeelState extends State<MyClassHadeel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignIn"),
      backgroundColor: Colors.indigoAccent,
      centerTitle: true,),
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your name",
            icon: Icon(Icons.account_circle_rounded)
          ),
        ),
      Padding(padding: EdgeInsets.only(bottom: 25)),
      TextField(
        decoration: InputDecoration(
          hintText: "Enter your password",
            icon: Icon(Icons.ad_units_outlined)),),

        Padding(padding: EdgeInsets.only(bottom: 70)),
        ElevatedButton(onPressed:  (){}, child: Text("SignIN"),
        style: ElevatedButton.styleFrom(shadowColor:Colors.indigo),)


          ],),
      
      
    ),
    );
  }
}
