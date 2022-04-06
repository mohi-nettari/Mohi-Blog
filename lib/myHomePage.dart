import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'post.dart';
import 'package:flutter_application_1/inputWidget.dart';
import 'package:flutter_application_1/postsList.dart';
class MyHomePage extends StatefulWidget {
  final User user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePoste(post));
    this.setState(() {
      posts.add(post);
    });
  }

  void updatePostse() {
    getAllPostse().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePostse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello World!')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(posts, widget.user)),
          TextInputWidget(this.newPost)
        ]));
  }
}