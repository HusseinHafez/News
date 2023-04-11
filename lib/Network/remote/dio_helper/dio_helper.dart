// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';

class DioHelper{

 Dio? dio;
DioHelper(){
BaseOptions options=
    BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
       
      );
      if (kDebugMode) {
      dio = Dio(options)
        ..interceptors.addAll([
          HttpFormatter(),
        ]);
    } else {
      dio = Dio(options);
    }
}




   Future<Map> getData(
  {
    required String url,
    required Map<String,dynamic> query,
  }
  )async
    {
      try{
        Response? map=
            await dio?.get(url,queryParameters: query) ;
            return map!.data;
      }  catch (error){
        return
        {
          'error':error.toString(),
        };
      }
   
    }
}