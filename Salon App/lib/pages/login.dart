import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String? mail,password;
  TextEditingController emailcontroller= new TextEditingController();
TextEditingController passwordcontroller= new TextEditingController();

final _formkey=GlobalKey<FormState>();


userLogin()async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail!, password: password!);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  } on FirebaseAuthException catch(e) {
    // if(e.code=="user-not-found"){
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email",style: TextStyle(fontSize: 18.0,color: Colors.black),)));
    // }
    // else if(e.code=="wrong-password"){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided by user",style: TextStyle(fontSize: 18.0,color: Colors.black),)));

    // }
    if (e != null && context != null) {
  if (e.code == "user-not-found") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "No user found for that email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
  } else if (e.code == "wrong-password") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Wrong password provided by user",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
  }
}

  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFFB91635),
                Color(0xff621d3c),
                Color(0xFF311937)
              ])),
              child: Text(
                "Hello\nSign in! ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gmail",
                        style: TextStyle(
                            color: Color(0xFFB91635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Email";
                  
                          }
                          return null;
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: "Gmail", prefixIcon: Icon(Icons.mail)),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Color(0xFFB91635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Password";
                  
                          }
                          return null;
                        },
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            prefixIcon: Icon(Icons.password_outlined)),
                        obscureText: true,
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password? ",
                            style: TextStyle(
                                color: Color(0xFF311937),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0,),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              mail=emailcontroller.text;
                              password=passwordcontroller.text;
                            });
                            userLogin();
                          }
                        },
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Color(0xFFB91635),
                                          Color(0xff621d3c),
                                          Color(0xFF311937)
                                  ]),
                                  borderRadius: BorderRadius.circular(30)),
                          child: Center(child: Text("SIGN IN", style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Don't have account?", style: TextStyle(color: Color(0xFF311937),fontSize: 17.0,fontWeight: FontWeight.w500),),
                        ],
                      ),
                       GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text("Sign Up", style: TextStyle(color:  Color(0xff621d3c),fontSize: 20.0,fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),
                  
                  
                  
                    ],
                  ),
                )
                )
          ],
        ),
      ),
    );
  }
}
