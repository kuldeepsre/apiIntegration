import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketProvider extends ChangeNotifier {

  final WebSocketChannel channel =
  WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  List<String> messages = [];

  SocketProvider() {
    listenMessage();
  }

  void listenMessage() {
    channel.stream.listen((message) {
      messages.add(message);
      notifyListeners();
    });
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      channel.sink.add(message);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}