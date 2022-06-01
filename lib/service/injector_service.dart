import 'package:flutter_simple_dependency_injection/injector.dart';

import 'socket_service.dart';

class InjectService {
  Injector initialise(Injector injector) {
    injector.map<SocketService>((i) => SocketService(), isSingleton: true);
    return injector;
  }
}
