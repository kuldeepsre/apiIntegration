import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/provider/QutesProvider.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        Provider.of<QutesProvider>(context, listen: false).fetchQutes()
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QutesProvider>(context);
    return Scaffold(
      body: Builder(
          builder: (context) {
            if(provider.isLoading){
              return LinearProgressIndicator();
            }
            if(provider.error!=null){
              return Center(child: Text(provider.error.toString()),);
            }
            return ListView.builder(
                shrinkWrap: true,

                itemCount: provider.quotesList.length,
                itemBuilder: (context, index) {
                  final data = provider.quotesList[index];
                  return Text(data.author.toString());
                },
            );
          }
      ),
    );
  }
}