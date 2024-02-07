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


  ProviderState(){
  fetchUsersData();
  }

  ApiHandler handler = ApiHandler();
  Future<void> fetchUsersData()async{
    users = UserModel.fromJson(await UserRepository().fetchData());
    isLoading = false;
    notifyListeners();
  }

}