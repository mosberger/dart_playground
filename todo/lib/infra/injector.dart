import 'package:todo/auth/google_validator.dart';
import 'package:todo/auth/validation_behavior.dart';

import '../todo.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(TodoController)
  void controllers();

  @Register.singleton(GoogleValidator)
  @Register.singleton(ValidationBehavior)
  void validators();
}

class KiwiInjector {
  get container => Container();

  void setup() {
    _$Injector()
      ..controllers()
      ..validators();
  }

  T call<T>() => container<T>();
}
