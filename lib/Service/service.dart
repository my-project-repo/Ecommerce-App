import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
class Service {
  Future<http.Response> saveUser(String email, String password) async
  {
    var url = Uri.parse("http://192.168.18.215:8080/login/user");
    Map<String,String> headers = {"Content-Type" : "application/json"};
    Map data = {
      'email' : '$email',
      'password' : '$password',
    };
    var body = json.encode(data);
    var response = await http.post(url, headers:headers, body:body);
    print(response.body);
    return response;
  }
    Future<http.Response> getData (String email) async
  {
    final uri = Uri.parse("http://192.168.18.215:8080/login/user/email/$email");
    var response = await http.get(uri);
      return response;
  }
  Future<bool> verifyData (String email , String password) async
  {
    final response = await getData(email);
    if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body);
        print(data);
      if (data != null && data['email'] is String && data['password'] is String) {
          return (email == data['email'] && password == data['password']);
        }

      }
    return false;
  }
}