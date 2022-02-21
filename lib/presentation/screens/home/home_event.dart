abstract class HomeEvent {
  HomeEvent();
}

class EnterRoom extends HomeEvent {
  @override
  String toString() => 'EnterRoom Event';
}
