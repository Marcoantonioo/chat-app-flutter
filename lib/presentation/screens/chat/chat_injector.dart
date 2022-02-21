import 'package:chat_app/architecture/injection/injector.dart';
import 'package:chat_app/presentation/screens/chat/chat_controller.dart';
import 'package:chat_app/presentation/screens/chat/chat_provider.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received_mapper.dart';

class ChatInjector extends Injector {
  @override
  void dependencies() {
    put(MessageReceivedMapper());
    put(ChatProvider(socket: find(), mapper: find()));
    put(ChatController(loginProvider: find()));
  }
}
