import 'package:chat_app/presentation/screens/chat/chat_controller.dart';
import 'package:chat_app/presentation/screens/chat/chat_event.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received.dart';
import 'package:chat_app/presentation/widgets/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends ScreenView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.green[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Grupo ${controller.user!.roomName}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Na sala como ${controller.user!.userName}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                )),
            Obx(
              () => Expanded(
                flex: 24,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.messages.length,
                  itemBuilder: (_, index) {
                    final message = controller.messages[index];
                    return _buildMessage(message, context);
                  },
                ),
              ),
            ),
            const Spacer(),
            TextFormField(
              onChanged: (v) {
                controller.msgToSend.value = v;
              },
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                hintText: 'Escreva sua mensagem',
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.dispatchEvent(SendMessage());
                    _textEditingController.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: const Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(MessageReceived message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: controller.isFromMe(message.idUser)
              ? Colors.blue[100]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: controller.isFromMe(message.idUser)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                controller.isFromMe(message.idUser)
                    ? controller.user!.userName
                    : 'Outro usuário',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.black87),
              ),
              Text(
                message.data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
