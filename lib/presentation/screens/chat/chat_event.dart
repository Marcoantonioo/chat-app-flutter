abstract class ChatEvent {
  ChatEvent();
}

class SendMessage extends ChatEvent {
  @override
  String toString() => 'Sending Message';
}
