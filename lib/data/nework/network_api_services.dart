import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/nework/base_api_services.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson= returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      http.Response response = await http.post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson= returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  dynamic returnResponse (http.Response response){
  switch(response.statusCode){
    case 200:
      dynamic responsejson = jsonDecode(response.body);
      return responsejson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 500:
    case 404:
      throw UnAuthorisedException(response.body.toString());
    default:
      throw FetchDataException('Error occured while communicating with server'+
      'with status code: ' +response.statusCode.toString());
  }
  }
}