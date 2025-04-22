import 'package:http/http.dart' as http;
class HttpHelper {

  static final HttpHelper instance = HttpHelper._internal();
  HttpHelper._internal();
 

  String get getBaseUrl => "http://192.168.100.111:5000/api/";
  String get getLoginUrl => "${getBaseUrl}passengers/login";
  String get getRegisterUrl => "${getBaseUrl}passengers/register";

  Future<http.Response> get(
    String url, {Map<String, String>? headers}) async{
    return await http.get(Uri.parse(url), headers: headers);
    }

  Future<http.Response> post(
    String url, {Map<String, String>? headers, Map<String,dynamic>? body,}) async {
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }




}