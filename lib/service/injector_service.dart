import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mefood/model/base/base.dart';

import 'socket_service.dart';

class InjectService {
  Injector initialise(Injector injector, MemberModel member) {
    injector.map<SocketService>(
      (i) => SocketService(owner: member),
      isSingleton: true,
    );
    return injector;
  }
}
