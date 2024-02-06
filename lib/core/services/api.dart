import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future<User?> getUserProfile(int? userId) async {
    // Get user profile for id
    var response = await client.get(
      Uri.parse('$endpoint/users/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    // handle any errors
    if (response.statusCode != 200) {
      return null;
    } else {
      // Convert and return
      return User.fromJson(json.decode(response.body));
    }
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];
    // Get user posts for id
    var response = await client.get(
      Uri.parse('$endpoint/posts?userId=$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint('response: ${response.body}');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];

    // Get comments for post
    var response = await client.get(
      Uri.parse('$endpoint/comments?postId=$postId'),
      headers: {'Content-Type': 'application/json'},
    );

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
