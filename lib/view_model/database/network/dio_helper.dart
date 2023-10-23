import 'package:dio/dio.dart';

import 'end_points.dart';


class DioHelper{
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
          }
      ),
    );
  }

  static  Future<Response> getData({
    required String url,
  })async{
    dio!.options.headers={
      "Content-Type" : "application/json",
    };
    return await dio!.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,

    required Map<String,dynamic> data,

  })async{
    dio!.options.headers={
      "Content-Type" : "application/json",
    };
    return await dio!.post(
      url,
      data: data,

    );
  }


  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String,dynamic> data,
    String lang = "en",
    String? token,
  })async{
    dio!.options.headers={
      "lang" : lang,
      "Authorization" : token??'',
      "Content-Type" : "application/json",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> deleteData ({
    required String url,
    String lang = 'en',
    String ?token
  })async
  {
    dio!.options.headers =
    {
      'lang' : lang,
      'Authorization' : token??'',
      'Content-Type' : 'application/json',
    };
    return await dio!.delete(url);
  }



}