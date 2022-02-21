import 'package:chat_app/architecture/controller/controller.dart';
import 'package:chat_app/presentation/screens/chat/chat_event.dart';
import 'package:chat_app/presentation/screens/chat/chat_provider.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received.dart';
import 'package:chat_app/presentation/screens/home/model/user_model.dart';
import 'package:get/get.dart';

class ChatController extends BaseController<ChatEvent> {
  final ChatProvider _provider;

  ChatController({
    required ChatProvider loginProvider,
  }) : _provider = loginProvider;

  late UserModel? user;
  late RxList<MessageReceived> messages;
  late RxString msgToSend;

  @override
  void onInit() {
    super.onInit();
    _handleOnInit();
    _handleOnMessageReceived();
  }

  @override
  void handleEvents(ChatEvent? event) {
    if (event is SendMessage) {
      _handleSendMessage();
    }
  }

  void _handleSendMessage() {
    _provider.sendMessage(msgToSend.value);
  }

  void _handleOnMessageReceived() {
    _provider.onMessageReceived((msg) {
      messages.add(msg);
    });
  }

  void _handleOnInit() {
    user = getArguments();
    messages = RxList.empty();
    msgToSend = "".obs;
  }

  bool isFromMe(String id) => user?.id == id;
}
