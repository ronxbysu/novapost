part of 'profile_switcher_bloc.dart';

abstract class ProfileSwitcherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAccount extends ProfileSwitcherEvent {}

class SwitchProfile extends ProfileSwitcherEvent {
  final String profileId;
  SwitchProfile(this.profileId);

  @override
  List<Object?> get props => [profileId];
}

class AddProfile extends ProfileSwitcherEvent {
  final ProfileType type;
  AddProfile(this.type);

  @override
  List<Object?> get props => [type];
}
