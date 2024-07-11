import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_Services{

  static Future<dynamic> limit()async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_limit.php'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<dynamic> top()async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_top.php'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<dynamic> fetch()async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_fetch.php'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<dynamic> description(id)async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_desc.php?id=$id'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<dynamic> update(id,img,title,desc,cat,views)async{
    var request = http.Request('POST', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_update.php?id=$id'));
    request.body = json.encode({
      "id": id,
      "bimg": '${img}',
      "btitle": '${title}',
      "bdesc": '${desc}',
      "bcat": '${cat}',
      "bviews": '${views}'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> cateegory(cat)async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_cat.php?cat=$cat'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<dynamic> search(s)async{
    var request = http.Request('GET', Uri.parse('https://peepsdata.000webhostapp.com/blog/api_search.php?s=$s'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }
}