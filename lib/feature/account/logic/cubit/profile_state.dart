import 'package:freetalk/feature/account/data/model/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';


@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.success(ProfileModel user) = _Success;

  const factory ProfileState.error(String message) = _Error;
}

//command
// flutter pub run build_runner build --delete-conflicting-outputs