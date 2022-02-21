import 'package:chat_app/architecture/mapper/abstract_mapper.dart';
import 'package:chat_app/presentation/screens/home/model/user_model.dart';

class UserMapper extends AbstractMapper<UserModel> {
  @override
  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
        roomName: map['roomname'],
        userName: map['username'],
        id: map['id'],
        usersInRoom: (map['usersInRoom'] != null
            ? listFromMap(map['usersInRoom'])
            : null));
  }

  @override
  Map<String, dynamic> toMap(UserModel entity) {
    return {
      "username": entity.userName,
      "roomName": entity.roomName,
    };
  }
}
