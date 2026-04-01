import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/albumprovider.dart';

class AlbumScreeen extends StatefulWidget {
  const AlbumScreeen({super.key});

  @override
  State<AlbumScreeen> createState() => _AlbumScreeenState();
}

class _AlbumScreeenState extends State<AlbumScreeen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()=>Provider.of<AlbumProvider>(context,listen: false).fetchAlbum());

  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AlbumProvider>(context);

    return SafeArea(
      child: Scaffold(

          body: Builder(
            builder: (context) {

              if(provider.isLoading){
                return LinearProgressIndicator();
              }
              if(provider.error!=null){
                return Center(child: Text(provider.error.toString()),);
              }
              return ListView.builder(
                  itemCount: provider.albumList.length,
                  itemBuilder: (context,index)
              {
                final data=provider.albumList[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title.toString()),
                    Text(data.id.toString()),
                  ],
                );

              }
              );
            }
          )),
    );
  }
}
