// lib/account/view/account_page.dart

import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/account/bloc/account_bloc.dart';
import 'package:novapost/home/home_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return         BlocProvider(
      create: (context) => AccountBloc(
        context.read<AccountRepository>(),
      )..add(FetchAccount()),
      child: const AccountView(),
    );
/*    return BlocProvider.value(
      value: context.read<AccountBloc>()..add(FetchAccount()),
      child: const AccountView(),
    );*/
  }
}

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Profiles'),
      ),
      body: BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is AccountError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
          // After a profile is selected and the account is updated, navigate home
          if (state is AccountLoaded && context.read<AccountBloc>().state is! AccountLoading) {
            // This logic can be tricky, might need refinement based on exact flow
            // For now, we assume any load after a selection means success
          }
        },
        builder: (context, state) {
          if (state is AccountLoading || state is AccountInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AccountLoaded) {
            final profiles = state.account.profiles;
            final activeProfileId = state.account.activeProfileId;
            final canAddProfile = profiles.length < 3; // There are only 3 ProfileTypes

            return GridView.builder(
              padding: const EdgeInsets.all(24.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: canAddProfile ? profiles.length + 1 : profiles.length,
              itemBuilder: (context, index) {
                if (canAddProfile && index == profiles.length) {
                  // This is the "Add Profile" button
                  return _AddProfileButton();
                }
                final profile = profiles[index];
                return _ProfileCircle(
                  profile: profile,
                  isActive: profile.id == activeProfileId,
                  onTap: () {
                    // Set the tapped profile as active
                    context
                        .read<AccountBloc>()
                        .add(SetActiveProfileInAccount(profile.id));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                );
              },
            );
          }
          // Fallback for other states like AccountError
          return const Center(child: Text('Could not load profiles.'));
        },
      ),
    );
  }
}

class _ProfileCircle extends StatelessWidget {
  final Profile profile;
  final bool isActive;
  final VoidCallback onTap;

  const _ProfileCircle({
    required this.profile,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isActive
              ? Border.all(color: Theme.of(context).primaryColor, width: 4)
              : Border.all(color: Colors.grey.shade300, width: 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            profile.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _AddProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountPage(),
          ),
        ).then((_) {
          // After returning from the add profile flow, refresh the account page
          context.read<AccountBloc>().add(FetchAccount()); //TODO: fix using context across async functions
        });;
        // Navigate to the profile switcher page which already has the logic for adding profiles
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 2, style: BorderStyle.solid),
          color: Colors.grey.shade50,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 48,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
