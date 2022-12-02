
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        headers: {
          'Content-Type' :'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }
     static Future<Response> getData({
      required String url,
       String lang ='ar',
       String? token,
      required Map<String,dynamic> query,
    }) async
{
  dio!.options.headers = {
        'lang':lang,
        'Authorization':token,
      };

  return await dio!.get(
      url, queryParameters: query);
}
  static Future<Response> putData({
  required String url,
    Map<String, dynamic>? query,
  required  Map<String, dynamic> data,
    String lang ='ar',
    String? token,
  }) async{
    dio!.options.headers = {
      'lang':lang,
      'Authorization':token,
    };
    return  dio!.post(
      url,
      data: data,
  queryParameters: query
      );}
  }
