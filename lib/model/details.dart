import 'package:flutter/material.dart';

class Details {
  const Details({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
   
  });

  final int userId;
  final int id;
  final String title;
  final String body;
 

  factory Details.fromJson(Map<String, dynamic> json) {
    print(json);
    return Details(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return "user id : ${this.userId}, title: ${this.title}";
  }
}


