import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/sockrtprovider.dart';

class SocketScreen extends StatelessWidget {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final socketProvider = Provider.of<SocketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket Example"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: socketProvider.messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(socketProvider.messages[index]),
                );
              },
            ),
          ),

          Row(
            children: [

              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Enter message",
                  ),
                ),
              ),

              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  socketProvider.sendMessage(controller.text);
                  controller.clear();
                },
              )

            ],
          )
        ],
      ),
    );
  }
}