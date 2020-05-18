import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/model/author_api_model.dart';
import 'package:newsapp/utilites/api_utilites.dart';

class AuthorApi {
  Future<List<Author>> fetchAllAuthor() async {
    List<Author> authors = List<Author>();
    String allAuthorApi = 'http://newsapi.aba.vg/public/api/authors';
    var response = await http.get(allAuthorApi);
    var jsonData = jsonDecode(response.body);
    print("Respons Status : ${response.statusCode}");
    if (response.statusCode == 200) {
      var data = jsonData['data'];
      for (var item in data) {
        Author author = Author(
            item['id'].toString(),
            item['name'].toString(),
            item['email'].toString(),
            item['api_token'].toString(),
            item['avatar'].toString());
        authors.add(author);
      }
      for(Author author in authors){
        print(author.email);
      }
    }
    return authors;
  }
}
