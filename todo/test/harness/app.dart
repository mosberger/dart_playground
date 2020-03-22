import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/auth/google_validator.dart';
import 'package:todo/auth/validation_behavior.dart';
import 'package:todo/todo.dart';

export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

class MockValidationBehavior extends Mock implements ValidationBehavior {}

class Harness extends TestHarness<TodoApp> {
  final validationMock = MockValidationBehavior();

  @override
  Future onSetUp() async {
    when(validationMock.call(any, any)).thenAnswer((c) => Future.value(true));
    channel.injector<GoogleValidator>().validationBehavior = validationMock;
  }

  @override
  Future onTearDown() async {}
}
