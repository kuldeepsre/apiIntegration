import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/be_provider.dart';

class BeScreen extends StatefulWidget {
  const BeScreen({super.key});

  @override
  State<BeScreen> createState() => _BeResponseState();
}

class _BeResponseState extends State<BeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()=>Provider.of<BeProvider>(context,listen: false).fetchBeData());
  }
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<BeProvider>(context);
    return Scaffold(

        body: Builder(
          builder: (context) {
            return ListView.builder(
              itemCount: provider.beList.length,
                itemBuilder: (context,index)

            {
       final data=provider.beList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name.toString()),
                    Text(data.lines!.join(", ").toString()),
                    Text(data.oceans!.join(", ").toString()),
                  ],
                ),
              ),
            ),
          );


            }
            );
          }
        )


    );
  }
}
