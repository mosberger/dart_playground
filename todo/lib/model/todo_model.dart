import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid_type/uuid_type.dart';

part 'todo_model.freezed.dart';

part 'todo_model.g.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  factory TodoModel._({
    String id,
    String title,
    bool done,
    DateTime createTimestamp,
    @nullable DateTime updateTimestamp,
  }) = _TodoModel;

  factory TodoModel.create(String title) => TodoModel._(
        id: uuid.v4(),
        title: title,
        done: false,
        createTimestamp: DateTime.now(),
        updateTimestamp: null,
      );

  factory TodoModel.update(_TodoModel model, {bool done}) =>
      model.copyWith(done: done, updateTimestamp: DateTime.now());

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
