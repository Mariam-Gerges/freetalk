import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit_state.freezed.dart';

@freezed
class AuthCubitState<T> with _$AuthCubitState<T> {
  const factory AuthCubitState.initial() = _Initial;
  const factory AuthCubitState.loading() = _Loading;
  const factory AuthCubitState.success(T data) = _Success<T>;
  const factory AuthCubitState.error({required String error}) = _Error;
}


