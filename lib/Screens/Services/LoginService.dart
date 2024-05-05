
import 'package:dio/dio.dart';
import 'package:sarfkind_apitest/Screens/Models/LoginResponse.dart';

String urlbase = "http://46.101.62.121:9055/api/sign-in";

Future<LoginResponse> loginApi(String username, String userPassword) async{
  Response response;
  var dio = Dio();

  try{
    response = await dio.post(urlbase,
        data: {
          'jsonrpc': '2.0',
          'params': {
            'db': 'eNamaa221122',
            'login': username,
            'password': userPassword,
            'force_login': 1}},
        options: Options(headers: {
          'Content-Type' : 'application/json',
        }));

    LoginResponse reponse;
    if (response.statusCode == 200) {
      reponse = LoginResponse.fromJson(response.data);
      return reponse;
    } else {
      reponse = LoginResponse.fromJson(response.data);
      throw Exception(reponse.result);
    }
    print(response);
  }catch(e){
    throw Exception(e);
  }
}