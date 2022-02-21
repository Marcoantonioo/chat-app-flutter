import 'package:chat_app/architecture/injection/injector.dart';
import 'package:chat_app/core/socket/socket.dart';
import 'package:chat_app/core/socket/socket_impl.dart';

class CoreInjector extends Injector {
  @override
  void dependencies() {
    /// Deixar comentado, as dependencias são criadas na inicialização do
    /// [AppStateComponent]
    // put(SessionMapper());
    // put<AuthSession>(AuthSessionImpl(mapper: find()));
    // put<Connector>(ConnectorImpl(authSession: find()));
    put<Socket>(SocketImpl());
  }
}
