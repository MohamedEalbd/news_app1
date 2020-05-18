import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/post.dart';

class PostAPI{
   Future <List<Post>> fetchWhatsNew() async {
     List<Post> posts = List<Post>();
     var respons = await http.get(
           'http://newsapi.aba.vg/public/api/posts/author/25');

     var jsondata = json.decode(respons.body);

     for(var items in jsondata['data']){
       Post post = Post(
         id: items["id"].toString(),
         title: items["title"].toString(),
         content: items["content"].toString(),
         date_written: items["date_written"].toString(),
         featured_image: items['featured_image'].toString(),
         votes_up: items['votes_up'],
         votes_down:  items['votes_down'],
         voters_up:( items["voters_up"] == null) ? List<int>() :jsonDecode(items["voters_up"]),
         voters_down: ( items["voters_down"] == null) ? List<int>() :jsonDecode(items["voters_down"]),
         user_id: items["user_id"],
         category_id: items["category_id"],
       );
       posts.add(post);
       print(posts.length);
     }
     return posts;
   }
}