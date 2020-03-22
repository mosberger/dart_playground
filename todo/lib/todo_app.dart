import 'auth/google_validator.dart';
import 'infra/injector.dart';

import 'todo.dart';

class TodoApp extends ApplicationChannel {
  final injector = KiwiInjector();

  @override
  Future prepare() async {
    injector.setup();
  }

  @override
  Controller get entryPoint => Router()
    ..route('/todos')
        .link(() => Authorizer.bearer(injector<GoogleValidator>()))
        .link(() => injector<TodoController>());
}
