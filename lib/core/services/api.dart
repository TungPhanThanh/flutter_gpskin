import 'dart:convert';

import 'package:flutter_gpskin/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'http://gpskin-as-test.us-west-2.elasticbeanstalk.com/';

  var client = new http.Client();

  Future<int> loginUser(String userId, String password) async {
    final http.Response response = await http.post(
      '$endpoint/subject/signIn/',
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(<String, String>{'subjectId':userId,'password':password}),
    );

    if(response.statusCode == 200){
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      User.fromJson(json.decode(response.body));
    }
    return response.statusCode;
  }

//  Future<List<Post>> getPostsForUser(int userId) async {
//    var posts = List<Post>();
//    // Get user posts for id
//    var response = await client.get('$endpoint/posts?userId=$userId');
//
//    // parse into List
//    var parsed = json.decode(response.body) as List<dynamic>;
//
//    // loop and convert each item to Post
//    for (var post in parsed) {
//      posts.add(Post.fromJson(post));
//    }
//
//    return posts;
//  }
//
//  Future<List<Comment>> getCommentsForPost(int postId) async {
//    var comments = List<Comment>();
//
//    // Get comments for post
//    var response = await client.get('$endpoint/comments?postId=$postId');
//
//    // Parse into List
//    var parsed = json.decode(response.body) as List<dynamic>;
//
//    // Loop and convert each item to a Comment
//    for (var comment in parsed) {
//      comments.add(Comment.fromJson(comment));
//    }
//
//    return comments;
//  }
}
