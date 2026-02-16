// lib/account/bloc/account_bloc.dart

import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;

  AccountBloc(this._accountRepository) : super(AccountInitial()) {
    on<FetchAccount>(_onFetchAccount);
    on<CreateAccount>(_onCreateAccount);
    on<UpdateAccount>(_onUpdateAccount);
    on<DeleteAccount>(_onDeleteAccount);
    on<GetAccount>(_onGetAccount);
    on<AddProfileToAccount>(_onAddProfileToAccount);
    on<SetActiveProfileInAccount>(_onSetActiveProfileInAccount);
  }

  Future<void> _onFetchAccount(
      FetchAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      final account = await _accountRepository.fetchAccount();
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onCreateAccount(
      CreateAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      final account = await _accountRepository.createAccount(event.account);
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onUpdateAccount(
      UpdateAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      final account = await _accountRepository.updateAccount(event.account);
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onDeleteAccount(
      DeleteAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      await _accountRepository.deleteAccount(event.account);
      emit(AccountDeleted());
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onGetAccount(
      GetAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      final account = await _accountRepository.getAccount(event.account);
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onAddProfileToAccount(
      AddProfileToAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      await _accountRepository.addProfile(event.type, event.displayName);
      // After adding, we should probably refetch the main account to get the updated profile list
      final account = await _accountRepository.fetchAccount();
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> _onSetActiveProfileInAccount(
      SetActiveProfileInAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    try {
      await _accountRepository.setActiveProfile(event.profileId);
      // After setting active, refetch the account to reflect the change
      final account = await _accountRepository.fetchAccount();
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }
}
