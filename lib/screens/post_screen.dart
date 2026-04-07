import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/post_provider.dart';

import '../provider/reciept_provider.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PostProvider>(context, listen: false).fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);

    if (provider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.error != null) {
      return Scaffold(
        body: Center(child: Text(provider.error!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: ListView.builder(
        itemCount: provider.list.length,
        itemBuilder: (context, index) {
          final Post = provider.list[index];

          return Card(
            child: ListTile(
            /*  leading: Image.network(Post.image ?? ""),*/
              title: Text(Post.body ?? ""),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Tages: ${ Post.tags != null && Post.tags!.isNotEmpty
                      ? Post.tags!.take(9).join(", ")
                      : "Tages"}"),

                  Row(
                    children: [
                      Text("Like: ${ Post.reactions?.likes.toString()}"),
                      SizedBox(width: 40,),
                      Text("DisLike: ${ Post.reactions?.dislikes.toString()}"),
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}