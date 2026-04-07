import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/comment_provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()=>Provider.of<CommentProvider>(context,listen: false).fetchComments());
  }
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<CommentProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Comments"),),
        body: Builder(
          builder: (context) {

            if(provider.isLoading){
              return LinearProgressIndicator();
            }
            if(provider.error!=null){
              return Center(child: Text(provider.error.toString()));
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: provider.list.length,
                itemBuilder: (context,index)
            {
              final data=provider.list[index];
              return ListTile(
                title: Text(data.body.toString()),
                subtitle: Text(data.user!.fullName.toString()),
              );
            }

            );
          }
        ));
  }
}
