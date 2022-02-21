import 'dart:developer';

import 'package:chat_app/architecture/utils/constants.dart';
import 'package:chat_app/core/socket/socket.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketImpl extends Socket {
  final IO.Socket _instance = IO.io(BASE_SOCKET_URL, <String, dynamic>{
    'transports': ['websocket']
  });

  @override
  void open() {
    _instance.open();
  }

  @override
  void emit(String event, [data]) {
    _instance.emit(event, data);
  }

  @override
  void disconnect() {
    _instance.disconnect();
  }

  @override
  void onConnect(dynamic Function(dynamic) handler) {
    _instance.onConnect((data) {
      log("Connected");
      handler.call(data);
    });
  }

  @override
  void on(String event, dynamic Function(dynamic) handler) {
    _instance.on(event, handler);
  }
}
