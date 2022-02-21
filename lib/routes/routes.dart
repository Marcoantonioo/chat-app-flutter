import 'package:chat_app/presentation/screens/chat/chat_injector.dart';
import 'package:chat_app/presentation/screens/chat/chat_screen.dart';
import 'package:chat_app/presentation/screens/home/home_injector.dart';
import 'package:chat_app/presentation/screens/home/home_screen.dart';
import 'package:chat_app/routes/route_name.dart';
import 'package:get/get.dart';

final List<GetPage> routes = [
  GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
      binding: HomeInjector()),
  GetPage(
      name: RouteName.chat,
      page: () => const ChatScreen(),
      binding: ChatInjector()),
];
