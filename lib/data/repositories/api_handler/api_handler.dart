
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHandler{

  Dio _dio = Dio();

  ApiHandler(){
    _dio.options.baseUrl = "https://reqres.in/";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get dio {
    return _dio;
  }

}