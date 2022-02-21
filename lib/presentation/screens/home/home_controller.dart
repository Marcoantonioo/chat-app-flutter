import 'package:chat_app/architecture/controller/controller.dart';
import 'package:chat_app/presentation/screens/home/home_event.dart';
import 'package:chat_app/presentation/screens/home/home_provider.dart';
import 'package:chat_app/presentation/screens/home/model/user_model.dart';
import 'package:chat_app/routes/route_name.dart';
import 'package:get/get.dart';

class HomeController extends BaseController<HomeEvent> {
  final HomeProvider _provider;

  HomeController({
    required HomeProvider loginProvider,
  }) : _provider = loginProvider;

  late RxString username;

  @override
  void onInit() {
    super.onInit();
    _handleOnInit();

    _provider.onJoinRoom((user) {
      popAndToNamed(RouteName.chat, arguments: user);
    });
  }

  @override
  void handleEvents(HomeEvent? event) {
    if (event is EnterRoom) {
      _handleEnterRoom();
    }
  }

  void _handleEnterRoom() {
    _provider.joinRoom(_buildUser());
  }

  UserModel _buildUser() =>
      UserModel(roomName: 'room', userName: username.value);

  void _handleOnInit() {
    username = "".obs;
  }
}
