import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed-classes.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User(String name, int age) = _User;
}
