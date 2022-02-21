import 'package:chat_app/architecture/injection/injector.dart';

class ComponentsInjector extends Injector {
  @override
  void dependencies() {
    // Não descomentar, injetado no [AppStateComponent]
    // AppStateComponentBinding().dependencies();
  }
}
