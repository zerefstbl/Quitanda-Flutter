import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitanda/src/models/user.model.dart';

part 'auth.result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(UserModel user) = Success;

  factory AuthResult.error(String message) = Error;
}
