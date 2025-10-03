part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String profileId;

  const LoadProfile(this.profileId);

  @override
  List<Object?> get props => [profileId];
}

class UpdateProfile extends ProfileEvent {
  final Profile profile;

  const UpdateProfile(this.profile);

  @override
  List<Object?> get props => [profile];
}

class LogoutProfile extends ProfileEvent {}
