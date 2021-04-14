import 'dart:convert';
import 'package:xmeme/model/meme.dart';
import 'package:http/http.dart' as http;

class MemeController {
  // Action controller for all meme opertaions

  // Server url
  final url = "http://13.127.167.22:8081/memes";

  // Fetches the recent 100 Memes
  Future<List<dynamic>> getMemes() async {
    var data;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      } else {
        return data;
      }
      for (var i = 0; i < data.length; i++) {
        data[i] = MemeModel.fromJson(data[i]);
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  // Creates a new meme
  Future<bool> postMeme(MemeModel model) async {
    try {
      var payload = jsonEncode(model.toJson());
      var response = await http.post(url,body: payload);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}