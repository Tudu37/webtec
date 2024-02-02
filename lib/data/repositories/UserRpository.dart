import 'package:dio/dio.dart';
import 'package:webtec/data/models/userModel.dart';
import 'package:webtec/data/repositories/api_handler/api_handler.dart';


class UserRepository{
  
  ApiHandler handler = ApiHandler();

  Future<dynamic> fetchData ()async{
    try{
      Response response = await handler.dio.get("api/users?page=1&per_page=10");
      dynamic fData = response.data;
      print("**************");
      return fData;
    }on DioException catch(ex){
      throw ex.message.toString();
    }
    
  }
  
  
}