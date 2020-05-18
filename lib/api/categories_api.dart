import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/model/category_id.dart';

class CategoriesAPI {
  Future<List<Category>> fetchCategories() async {
    List<Category> categories = List<Category>();
    String url = 'http://newsapi.aba.vg/public/api/categories';
    var respons = await http.get(url);
    if (respons.statusCode == 200) {
      var jsondata = jsonDecode(respons.body);
      var data = jsondata["data"];
      for (var item in data) {
        Category category = Category(
            id: item["id"].toString(), title: item["title"].toString());
        categories.add(category);
        print(category.title);
      }
    }
    return categories;
  }
}
