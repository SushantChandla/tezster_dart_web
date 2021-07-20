import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  // static Future<dynamic> performPostRequest(server, command, payload,
  //     {Map<String, String> headers}) async {
  //   // HttpClient httpClient = new HttpClient();
  //   // HttpClientRequest request = await httpClient.postUrl(
  //   //     command.isEmpty ? Uri.parse(server) : Uri.parse('$server/$command'));
  //   // request.headers.set('content-type', 'application/json');
  //   // if (headers == null) {
  //   //   request.add(utf8.encode(json.encode(payload)));
  //   // } else {
  //   //   headers.entries.forEach(
  //   //     (header) => request.headers.add(header.key, header.value),
  //   //   );
  //   //   request.headers.add('body', json.encode(payload));
  //   //   request.add(utf8.encode(json.encode(payload)));
  //   // }
  //   // HttpClientResponse response = await request.close();
  //   // String reply = await response.transform(utf8.decoder).join();
  //   // httpClient.close();
  //   final uri=  command.isEmpty ?Uri.parse(server):Uri.parse('$server/$command');
  //   final response = await http.post(uri,headers: {
  //     'content-type': 'application/json',
  //     ...headers
  //   },);

  //   // return reply;
  // }

   static Future<dynamic> performPostRequest(server, command, payload,
      {Map<String, String> headers}) async {
    headers = headers ?? {};
    var response = await http.post(
      command.isEmpty ? Uri.parse(server) : Uri.parse("$server/$command"),
      headers: {'Content-type': 'application/json', ...headers},
      body: utf8.encode(json.encode(payload)),
    );
    return response.body;
  }

  static Future<dynamic> performGetRequest(server, command) async {
    // HttpClient httpClient = new HttpClient();
    // HttpClientRequest request =
    //     await httpClient.getUrl(Uri.parse('$server/$command'));
    // HttpClientResponse response = await request.close();
    // String reply = await response.transform(utf8.decoder).join();
    // httpClient.close();
    // return jsonDecode(reply);
    
    return jsonDecode((await http.get(Uri.parse('$server/$command'))).body);
  }
}
