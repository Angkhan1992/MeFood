import 'package:flutter_simple_dependency_injection/injector.dart';

import 'socket_provider.dart';

class InjectProvider {
  Injector initialise(Injector injector) {
    injector.map<SocketProvider>((i) => SocketProvider(), isSingleton: true);
    return injector;
  }
}
