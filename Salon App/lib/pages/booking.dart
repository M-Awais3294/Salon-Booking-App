import 'package:barber_booking/services/database.dart';
import 'package:barber_booking/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  String service;
  Booking({required this.service});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  String? name,image,email;

  getthedatafromsharedpref() async {
    name=await SharedpreferenceHelper().getUserName();
    image=await SharedpreferenceHelper().getUserImage();
    email=await SharedpreferenceHelper().getUserEmail();
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





DateTime _selecetdDate=DateTime.now();
Future<void> _selectDate(BuildContext context)async{
  final DateTime? picked=await showDatePicker(context: context,initialDate: _selecetdDate, firstDate:DateTime(2024), lastDate: DateTime(2025));
  if(picked !=null && picked!=_selecetdDate){
    setState(() {
      _selecetdDate = picked;
    });
  }
  }

  TimeOfDay _selectedTime=TimeOfDay.now();

  Future<void> _selectTime(BuildContext context)async{

final TimeOfDay? picked=await showTimePicker(context: context, initialTime: _selectedTime);
 if(picked !=null && picked!=_selectedTime){
    setState(() {
      _selectedTime = picked;
    });
  }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(left:10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
              ),
            ),
            SizedBox(height: 10.0,),
            Text("Let's the journey begin",style: TextStyle(color: Colors.white70,fontSize: 28.0,fontWeight: FontWeight.w500),),
           
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/discount.png",fit: BoxFit.cover,
              ),
              ),
              SizedBox(height: 10.0,),
               Text(
                widget.service,style: TextStyle(color: Colors.white,fontSize: 28.0,fontWeight: FontWeight.bold
                ),
                
                ),
                SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFb4817e)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                   children: [
                     Text("Set a Date",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),),
                     SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              _selectDate(context);
                            },
                            child: Icon(Icons.calendar_month,color: Colors.white,size: 30.0,)),
                          SizedBox(width: 20.0,),
                          Text("${_selecetdDate.day}/${_selecetdDate.month}/${_selecetdDate.year}",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
                        ],
                      )
                   ],
                  ),

                ),

                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFb4817e)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                   children: [
                     Text("Set a Time",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),),
                     SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              _selectTime(context);
                            },
                            child: Icon(Icons.alarm,color: Colors.white,size: 30.0,)),
                          SizedBox(width: 20.0,),
                          Text(
                            _selectedTime.format(context),
                            style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
                        ],
                      )
                   ],
                  ),

                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: ()async{
                    Map<String, dynamic> userBookingmap={
                      "Service":widget.service,
                      "Date": "${_selecetdDate.day}/${_selecetdDate.month}/${_selecetdDate.year}".toString(),
                      "Time":_selectedTime.format(context).toString(),
                      "Username":name,
                      "Image": image,
                      "Email":email
                    };
                    await DatabaseMethods().addUserBooking(userBookingmap).then((value) => {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Service has been booked Successfully!!! ", 
    style: TextStyle(fontSize: 20.0),)))
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                                decoration: BoxDecoration(
                  color: Color(0xFFfe8f33),
                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(child: Text("BOOK NOW",style:TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)))
                              ),
                ),
          ],
        ),
      ),
    );
  }
}