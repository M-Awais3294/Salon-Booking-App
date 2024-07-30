import 'package:barber_booking/pages/booking.dart';
import 'package:barber_booking/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String? name,image;

  getthedatafromsharedpref() async {
    name=await SharedpreferenceHelper().getUserName();
    image=await SharedpreferenceHelper().getUserImage();
    setState(() {
      
    });
  }

getontheload()async{
  await getthedatafromsharedpref();
  setState(() {
    
  });

}
@override
  void initState() {
    getontheload();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF2b1615),
      body:Container(
        margin: EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello,", style: TextStyle(color: const Color.fromARGB(197, 255, 255, 255),fontSize: 24.0,fontWeight: FontWeight.w500),),
        if (name != null) // Add a null check
          Text(name!, style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold)),
      ],
    ),
    if (image != null) // Add a null check
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(image!, height: 100, width: 100, fit: BoxFit.cover),
      ),
  ],
),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
                    
            //         Text("Hello,", style: TextStyle(color: const Color.fromARGB(197, 255, 255, 255),fontSize: 24.0,fontWeight: FontWeight.w500),),
            //         Text(name??"Loading...", style: TextStyle(color:  Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),)
            //       ],
            //     ),
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(50),
            //       child: Image.network(image??"Loading...",height: 100,width: 100, fit: BoxFit.cover,)),
                
            //   ],
            // ),
            SizedBox(height:10.0),
            Divider(
              color: Colors.white30,

              ),
              SizedBox(height: 20.0,),
              Text("Services", 
              style: TextStyle(color:  Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Flexible(
                    fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Classic Shaving')));
                      },
                      child: Container(
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/shaving.png",height: 80,width: 80,fit: BoxFit.cover),
                            SizedBox(height: 10.0,),
                            Text("Classic Shaving", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Flexible(
                     fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Hair Washing')));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/hair.png", height: 80,width: 80,fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Hair Washing", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 20.0,),
              Row(
                children: [
                  Flexible(
                    fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Hair Cutting')));
                      },
                      child: Container(
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/cutting.png",height: 80,width: 80,fit: BoxFit.cover),
                            SizedBox(height: 10.0,),
                            Text("Hair Cutting", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Flexible(
                     fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Beard Trimming')));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/beard.png", height: 80,width: 80,fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Beard Trimming", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 20.0,),
              Row(
                children: [
                  Flexible(
                    fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Facials')));
                      },
                      child: Container(
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/facials.png",height: 80,width: 80,fit: BoxFit.cover),
                            SizedBox(height: 10.0,),
                            Text("Facials", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Flexible(
                     fit:FlexFit.tight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Kids HairCutting')));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFe29452)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/kids.png", height: 80,width: 80,fit: BoxFit.cover,),
                            SizedBox(height: 10.0,),
                            Text("Kids HairCutting", 
                      style: TextStyle(color:  Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ]),


      ),
    );
  }
}