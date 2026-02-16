part of 'profile_switcher_bloc.dart';

abstract class ProfileSwitcherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileSwitcherInitial extends ProfileSwitcherState {}

class ProfileSwitcherLoading extends ProfileSwitcherState {}

class ProfileSwitcherLoaded extends ProfileSwitcherState {
  final Account account;
  ProfileSwitcherLoaded(this.account);

  @override
  List<Object?> get props => [account];
}

class ProfileSwitcherError extends ProfileSwitcherState {
  final String message;
  ProfileSwitcherError(this.message);

  @override
  List<Object?> get props => [message];
}
