import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:webtec/data/models/userModel.dart';
import 'package:webtec/data/repositories/UserRpository.dart';
import 'package:webtec/data/repositories/api_handler/api_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProviderState extends ChangeNotifier{

  UserModel users=UserModel(page: 0, perPage: 0, total: 0, totalPages: 0, data: [], support:null);
  bool isLoading = true;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List fData=[];

  ProviderState(){
  fetchUsersData();
  }

  ApiHandler handler = ApiHandler();
  Future<void> fetchUsersData()async{
    try{
      // Response response = await handler.dio.get("api/users?page=1&per_page=10");
      Response response = await Dio().get("https://reqres.in/api/users?page=1&per_page=10");
       fData = response.data['data'];
      print("**************");
      // users = UserModel.fromJson(response.data);
    }on DioException catch(ex){
      throw ex.message.toString();
    }



    users = UserModel.fromJson(await UserRepository().fetchData());
    for(int i=0;i<fData.length;i++){
      _firestore.collection("users").doc("${i}").set(fData[i]);
    }
    isLoading = false;
    notifyListeners();
  }

}