import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/pages/login.dart';
import 'package:barber_booking/services/database.dart';
import 'package:barber_booking/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name,mail,password;


//To handle input fields data
TextEditingController namecontroller= new TextEditingController();
TextEditingController emailcontroller= new TextEditingController();
TextEditingController passwordcontroller= new TextEditingController();

// to check if the user have entered all data in respective fields
final _formkey=GlobalKey<FormState>();

registration()async{
  if(password !=null &&name!=null && mail!=null){
  try{
    UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail!, 
    password: password!);
    String id= randomAlphaNumeric(10);
    await SharedpreferenceHelper().saveUserName(namecontroller.text);
    await SharedpreferenceHelper().saveUserEmail(emailcontroller.text);
    await SharedpreferenceHelper().saveUserImage("https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a");
    await SharedpreferenceHelper().saveUserId(id);



    Map<String,dynamic>userInfoMap={
      "Name":namecontroller.text,
      "Email":emailcontroller.text,
      "Id":id,
      "Image":"https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a"


    };
    //upload data to firestore
    await DatabaseMethods().addUserDetails(userInfoMap, id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully", 
    style: TextStyle(fontSize: 20.0),)));
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
  } on FirebaseAuthException catch(e){
    if(e.code=='weak-password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password provided is too weak", 
    style: TextStyle(fontSize: 20.0),)));
    }
    else if(e.code == "email-already-in-use"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Already Exists", 
    style: TextStyle(fontSize: 20.0),)));

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
                "Create Your\nAccount! ",
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
                        "Name",
                        style: TextStyle(
                            color: Color(0xFFB91635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Name";
                  
                          }
                          return null;
                        },
                        controller: namecontroller,
                        decoration: InputDecoration(
                            hintText: "Name", prefixIcon: Icon(Icons.person_outline)),
                      ),
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
                     
                      
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              mail=emailcontroller.text;
                              name=namecontroller.text;
                              password=passwordcontroller.text;
                            });
                          }
                          registration();
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
                          child: Center(child: Text("SIGN UP", style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Already have an account?", style: TextStyle(color: Color(0xFF311937),fontSize: 17.0,fontWeight: FontWeight.w500),),
                        ],
                      ),
                       GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: ((context) =>LogIn())));
                        },
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text("Sign In", style: TextStyle(color:  Color(0xff621d3c),fontSize: 20.0,fontWeight: FontWeight.bold),),
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
  