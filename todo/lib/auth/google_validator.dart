import 'package:freezed_annotation/freezed_annotation.dart';
import 'validation_behavior.dart';
import '../todo.dart';

class GoogleValidator extends AuthValidator {
  GoogleValidator(this._validationBehavior);

  ValidationBehavior _validationBehavior;

  @visibleForTesting
  set validationBehavior(ValidationBehavior validationBehavior) {
    _validationBehavior = validationBehavior;
  }

  @override
  FutureOr<Authorization> validate<T>(
    AuthorizationParser<T> parser,
    T authorizationData, {
    List<AuthScope> requiredScope,
  }) async {
    if (parser is AuthorizationBearerParser &&
        await _validationBehavior(
          authorizationData as String,
          requiredScope,
        )) {
      return Authorization('fake', 0, this);
    }

    return null;
  }
}
