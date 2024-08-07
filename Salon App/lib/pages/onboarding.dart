import 'package:barber_booking/Admin/admin_login.dart';
import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/pages/login.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(top:90.0),
        child: Column(
          
          children: [
            Image.asset("images/barber.png"),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFdf711a),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Get a Stylish Haircut",style:TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold))
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdimLogin()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFdf711a),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Open Admin Panel",style:TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold))
              ),
            ),
          ],
        ),
      ),
    );
  }
}