
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future get({required String key}) async {
    var response = await client
        .get(Uri.parse('https://twitter154.p.rapidapi.com/$key'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-RapidAPI-Host': 'twitter154.p.rapidapi.com',
      'X-RapidAPI-Key': '61b160b16bmsh13a0dc5f17d24e3p10f006jsne06aa1655457'
    });

    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }
}
