import 'package:http/http.dart' as http;

class HttpHeaderChecker {
  Future<Map<String,String>> getHeaders(Uri uri) async {
    final res = await http.get(uri, headers: {'User-Agent': 'EduSecScanner/1.0'});
    return res.headers.map((k,v)=> MapEntry(k.toLowerCase(), v));
  }
}