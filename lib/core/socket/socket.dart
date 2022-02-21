abstract class Socket {
  void onConnect(dynamic Function(dynamic) handler);
  void emit(String event, [dynamic data]);
  void open();
  void on(String event, dynamic Function(dynamic) handler);
  void disconnect();
}
