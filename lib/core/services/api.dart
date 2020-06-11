import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gpskin/core/models/information_list.dart';
import 'package:flutter_gpskin/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'http://gpskin-as-test.us-west-2.elasticbeanstalk.com';

  var client = new http.Client();

  Future<int> loginUser(String userId, String password) async {
    final http.Response response = await http.post('$endpoint/subject/signIn/',
      headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8',},
      body: jsonEncode(<String, String>{'subjectId': userId, 'password': password}),
    );

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      User.fromJson(json.decode(response.body));
    }
    return response.statusCode;
  }

//  Future<List<InformationList>> getInformationList() async {
//    var user = List<User>();
//    // Get user posts for id
//    final http.Response response = await http.get('$endpoint/information/1');
//
//    // parse into List
////    print('Response status get: vao day');
////    print('Response status get: ${response.statusCode}');
////    print('Response body get: ${response.body}');
//    if (response.statusCode == 200) {
//      var parsed = json.decode(response.body) as List<dynamic>;
//
//      // loop and convert each item to Post
//      for (var infor in parsed) {
////        infors.add(InformationList.fromJson(infor));
//      }
//    }
//    return null;
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
