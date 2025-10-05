// lib/account/bloc/account_state.dart

part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

/// The initial state of the AccountBloc.
class AccountInitial extends AccountState {}

/// State indicating that an account operation is in progress.
class AccountLoading extends AccountState {}

/// State indicating that an account has been successfully loaded, created, or updated.
class AccountLoaded extends AccountState {
  final Account account;

  const AccountLoaded(this.account);

  @override
  List<Object> get props => [account];
}

/// State indicating an account has been deleted.
class AccountDeleted extends AccountState {}

/// State indicating an error occurred during an account operation.
class AccountError extends AccountState {
  final String message;

  const AccountError(this.message);

  @override
  List<Object> get props => [message];
}

/// State indicating a profile-related operation (add/set active) was successful.
/// This typically results in re-fetching the account to get the latest state.
class AccountUpdateSuccess extends AccountState {}
