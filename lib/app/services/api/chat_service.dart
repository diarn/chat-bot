import 'package:chat_bot/app/data/api_config.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<http.Response> getChat(String keyword, String? nim) async {
    Uri url = Uri.parse("${ApiConfig.chat}?keyword=$keyword");
    if (nim != "") {
      url = Uri.parse("${ApiConfig.chat}?keyword=$keyword&nim=$nim");
    }
    return await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
  }
}
