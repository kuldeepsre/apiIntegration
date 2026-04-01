import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/photo_provider.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<PhotoProvider>(context, listen: false).fechPhoto(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("PhotoList")),
      body: Builder(
        builder: (context) {
           if(provider.isLoding){
             return LinearProgressIndicator();
           }
           if(provider.error!=null){
             return Text(provider.error.toString());
           }
          return ListView.builder(
            shrinkWrap: true,

            itemCount: provider.photoList.length,

            itemBuilder: (context, index) {
             final data=provider.photoList[index];
              return Text(data.title.toString());
            },
          );
        }
      ),
    );
  }
}
