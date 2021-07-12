import 'package:http/http.dart' as http;

class AppService {

  static final AppService _service = AppService._internal();

  factory AppService(){
    return _service;
  }

  AppService._internal();

  Future<String> fetchData(String url) async{
    var urlParsed = Uri.parse(url);
    var response = await http.get(urlParsed);
    return response.body;
  }
}
