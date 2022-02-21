import 'package:chat_app/presentation/screens/home/home_controller.dart';
import 'package:chat_app/presentation/screens/home/home_event.dart';
import 'package:chat_app/presentation/widgets/screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ScreenView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInputTextName(),
          _buildButtonEnterRoom(),
        ],
      ),
    );
  }

  Widget _buildInputTextName() => Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Preencha com seu Nome'),
                TextFormField(
                  onChanged: (v) {
                    controller.username.value = v;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Entre com seu nome',
                  ),
                ),
              ],
            )),
      );

  Widget _buildButtonEnterRoom() => ElevatedButton(
        onPressed: () => controller.dispatchEvent(EnterRoom()),
        child: const Text('Entrar na sala'),
      );
}
