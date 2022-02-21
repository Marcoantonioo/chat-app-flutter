import 'package:chat_app/architecture/mapper/abstract_mapper.dart';
import 'package:chat_app/presentation/screens/chat/model/message_received.dart';

class MessageReceivedMapper extends AbstractMapper<MessageReceived> {
  @override
  MessageReceived fromMap(Map<String, dynamic> map) {
    return MessageReceived(
      data: map['data'],
      idUser: map['id'],
    );
  }

  @override
  Map<String, dynamic> toMap(MessageReceived entity) {
    return {
      'id': entity.idUser,
      'data': entity.data,
    };
  }
}
