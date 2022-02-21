import 'package:chat_app/architecture/mapper/abstract_mapper.dart';
import 'package:chat_app/core/auth_session/model/session_model.dart';

class SessionMapper extends AbstractMapper<SessionModel> {
  @override
  SessionModel fromMap(Map<String, dynamic> map) {
    return SessionModel(token: map['token']);
  }

  @override
  Map<String, dynamic> toMap(SessionModel entity) {
    return {
      "token": entity.token,
    };
  }
}
