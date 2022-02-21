import 'package:chat_app/core/connector/connector.dart';
import 'package:chat_app/core/socket/socket.dart';
import 'package:chat_app/presentation/screens/home/model/user_mapper.dart';
import 'package:chat_app/presentation/screens/home/model/user_model.dart';

class HomeProvider extends Connector {
  final Socket _socket;
  final UserMapper _mapper;

  HomeProvider({
    required Socket socket,
    required UserMapper mapper,
  })  : _socket = socket,
        _mapper = mapper;

  void joinRoom(UserModel user) =>
      _socket.emit('join room', _mapper.toMap(user));

  void onJoinRoom(Function(UserModel user) onJoined) {
    _socket.on('send data', (p0) {
      final remote = _mapper.fromMap(p0);
      onJoined.call(remote);
    });
  }
}
