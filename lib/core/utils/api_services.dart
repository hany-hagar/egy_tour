
import 'package:dio/dio.dart';

class ApiServices {

  static Dio? _dio;
  static Dio? _dio1;

  static init(){
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
      )
    );
  }
    static chatBotInit(){
    _dio1 = Dio(
      BaseOptions(
        baseUrl: "https://generativelanguage.googleapis.com/v1beta",
        receiveDataWhenStatusError: true,
      )
    );
  }


  Future<Response?> get({
    required String url,
    dynamic queryParameters,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
      "lang": lang,
      "Authorization":token
    };
    return await _dio?.get(
      url,
      queryParameters: queryParameters,
      data: data
    );
  }


  Future<Response?> post({
    required String url,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,

  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
        "lang": lang,
        "Authorization":token
      };
    return await _dio?.post(
        url,
        data: data,
    );
  }


  Future<Response?> put({
    required String url,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,

  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
      "lang": lang,
      "Authorization":token
    };
    return await _dio?.put(
        url,
        data: data
    );
  }


  Future<Response?> del({
    required String url,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,

  }) async {
    _dio?.options.headers= {
      'Content-Type':'application/json',
      "lang": lang,
      "Authorization":token
    };
    return await _dio?.put(
        url,
        data: data
    );
  }
  
  Future<Response?> getGeminiResponse(String message) async {
  const String apiKey = "AIzaSyB6XIHY-OPDoVRHH_dVbc7RRpY3p8ec5Gk"; // Replace with your actual Gemini API key
    return await _dio1?.post(
      "/models/gemini-1.5-flash:generateContent?key=$apiKey",
      data: {
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": message}
            ]
          }
        ],
      },
    );

}

}