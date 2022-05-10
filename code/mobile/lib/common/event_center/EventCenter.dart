typedef EventCallback = void Function(Map value);

class EventCenter {
  static final _core = _EventCenterCore();

  static void on(String event, EventCallback callback) {
    _core.on(event, callback);
  }

  static void off(String event, EventCallback callback) {
    _core.off(event, callback);
  }

  static void emit(String event, Map argv) {
    _core.emit(event, argv);
  }
}

class _EventCenterCore {
  // event -> []
  final _events = Map();

  void on(String event, EventCallback callback) {
    Set? listeners = _events[event];
    if (listeners == null) {
      listeners = Set();
      _events[event] = listeners;
    }
    listeners.add(callback);
  }

  void off(String event, EventCallback callback) {
    Set? listeners = _events[event];
    listeners?.remove(callback);
  }

  void emit(String event, Map argv) {
    Set? listeners = _events[event];
    listeners?.forEach((element) {
      element(argv);
    });
  }
}
