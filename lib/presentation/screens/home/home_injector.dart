import 'package:chat_app/architecture/injection/injector.dart';
import 'package:chat_app/presentation/screens/home/home_controller.dart';
import 'package:chat_app/presentation/screens/home/home_provider.dart';
import 'package:chat_app/presentation/screens/home/model/user_mapper.dart';

class HomeInjector extends Injector {
  @override
  void dependencies() {
    put(UserMapper());
    put(HomeProvider(socket: find(), mapper: find()));
    put(HomeController(loginProvider: find()));
  }
}
