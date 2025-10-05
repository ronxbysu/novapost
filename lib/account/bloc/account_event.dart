// lib/account/bloc/account_event.dart

part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch the account details for the currently authenticated user.
class FetchAccount extends AccountEvent {}

/// Event to create a new account.
class CreateAccount extends AccountEvent {
  final Account account;

  const CreateAccount(this.account);

  @override
  List<Object> get props => [account];
}

/// Event to update an existing account.
class UpdateAccount extends AccountEvent {
  final Account account;

  const UpdateAccount(this.account);

  @override
  List<Object> get props => [account];
}

/// Event to delete an account.
class DeleteAccount extends AccountEvent {
  final Account account;

  const DeleteAccount(this.account);

  @override
  List<Object> get props => [account];
}

/// Event to get a specific account's details.
class GetAccount extends AccountEvent {
  final Account account;

  const GetAccount(this.account);

  @override
  List<Object> get props => [account];
}

/// Event to add a new profile to the current account.
class AddProfileToAccount extends AccountEvent {
  final ProfileType type;
  final String displayName;

  const AddProfileToAccount(this.type, this.displayName);

  @override
  List<Object> get props => [type, displayName];
}

/// Event to set the active profile for the current account.
class SetActiveProfileInAccount extends AccountEvent {
  final String profileId;

  const SetActiveProfileInAccount(this.profileId);

  @override
  List<Object> get props => [profileId];
}
