import 'package:account_repository/account_repository.dart' show Account, AccountRepository, ProfileType;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';


part 'profile_switcher_event.dart';
part 'profile_switcher_state.dart';

// Bloc
class ProfileSwitcherBloc extends Bloc<ProfileSwitcherEvent, ProfileSwitcherState> {
  final AccountRepository accountRepository;

  ProfileSwitcherBloc(this.accountRepository) : super(ProfileSwitcherInitial()) {
    on<LoadAccount>((event, emit) async {
      emit(ProfileSwitcherLoading());
      try {
        final account = await accountRepository.fetchAccount();
        emit(ProfileSwitcherLoaded(account));
      } catch (e) {
        emit(ProfileSwitcherError('Failed to load account'));
      }
    });

    on<SwitchProfile>((event, emit) async {
      emit(ProfileSwitcherLoading());
      try {
        await accountRepository.setActiveProfile(event.profileId);
        final account = await accountRepository.fetchAccount();
        emit(ProfileSwitcherLoaded(account));
      } catch (e) {
        emit(ProfileSwitcherError('Failed to switch profile'));
      }
    });

    on<AddProfile>((event, emit) async {
      emit(ProfileSwitcherLoading());
      try {
        final displayName = event.type.name[0].toUpperCase() + event.type.name.substring(1);
        await accountRepository.addProfile(event.type, displayName);
        final account = await accountRepository.fetchAccount();
        emit(ProfileSwitcherLoaded(account));
      } catch (e) {
        emit(ProfileSwitcherError('Failed to add profile'));
      }
    });
  }
}