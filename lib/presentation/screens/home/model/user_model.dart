class UserModel {
  final String? id;
  final String userName;
  final String roomName;
  final List<UserModel>? usersInRoom;

  UserModel({
    this.id,
    this.usersInRoom,
    required this.userName,
    required this.roomName,
  });
}
