import 'package:chat_app/core/connector/connector.dart';
import 'package:chat_app/core/socket/socket.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received_mapper.dart';

class ChatProvider extends Connector {
  final Socket _socket;
  final MessageReceivedMapper _mapper;

  ChatProvider({
    required Socket socket,
    required MessageReceivedMapper mapper,
  })  : _socket = socket,
        _mapper = mapper;

  void sendMessage(String message) => _socket.emit('chat message', message);

  void onMessageReceived(Function(MessageReceived msg) onMessageReceivedr) {
    _socket.on(
      'chat message',
      (p0) {
        final remote = _mapper.fromMap(p0);
        onMessageReceivedr.call(remote);
      },
    );
  }
}
