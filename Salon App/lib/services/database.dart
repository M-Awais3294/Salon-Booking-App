import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addUserDetails(Map<String, dynamic>userInfoMap, String id)async{
    return await FirebaseFirestore.instance.collection("user").doc(id).set(userInfoMap);
  }

  // Collection for booking
  Future addUserBooking(Map<String, dynamic>userInfoMap)async{
    return await FirebaseFirestore.instance.collection("Booking").add(userInfoMap);
  }


  Future<Stream<QuerySnapshot>> getBookings()async{
    return await FirebaseFirestore.instance.collection("Booking").snapshots();

  }

     Future DeleteBooking(String id)async{
    return await FirebaseFirestore.instance.collection("Booking").doc(id).delete();
  }

}