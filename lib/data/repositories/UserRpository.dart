import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:webtec/data/models/userModel.dart';
import 'package:webtec/data/repositories/api_handler/api_handler.dart';


class UserRepository{
  
  ApiHandler handler = ApiHandler();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<dynamic> fetchData ()async{
    try{
      Response response = await handler.dio.get("api/users?page=1&per_page=10");
      dynamic fData = response.data;
      print("**************");
      UpdateFirestore();
      return fData;
    }on DioException catch(ex){
      throw ex.message.toString();
    }
    
  }

  void UpdateFirestore()async{
    try{
      Response response = await Dio().get("https://reqres.in/api/users?page=1&per_page=10");
      List userlist = response.data['data'];
      for(int i=0;i<userlist.length;i++){
        _firestore.collection("users").doc("${i}").set(userlist[i]);
      }
    }on FirebaseException catch(ex){
      throw ex.code;
    }
  }
  
  
}