import 'package:mvvm/data/nework/base_api_services.dart';
import 'package:mvvm/data/nework/network_api_services.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository{
BaseApiServices _baseApiServices = NetworkApiService();
Future<dynamic> loginApi(dynamic data) async{

  try{
  dynamic response = await _baseApiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
  return response;
  }catch(e){
 throw e;
  }
}
Future<dynamic> signupApi(dynamic data) async{

  try{
    dynamic response = await _baseApiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
    return response;
  }catch(e){
    throw e;
  }
}
}