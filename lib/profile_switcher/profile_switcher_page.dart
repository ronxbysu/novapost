// lib/profile_switcher/profile_switcher_page.dart

import 'package:account_repository/account_repository.dart'
    show AccountRepository, ProfileType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/home/home_page.dart';
import 'bloc/profile_switcher_bloc.dart';

class ProfileSwitcherPage extends StatelessWidget {

  const ProfileSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileSwitcherBloc(context.read<AccountRepository>(),)..add(LoadAccount()),
      child: BlocListener<ProfileSwitcherBloc, ProfileSwitcherState>(
        // Listen for success state to navigate
        listener: (context, state) {
          if (state is ProfileSwitcherLoaded) {
            // Navigate to home and remove all previous routes
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        child: BlocBuilder<ProfileSwitcherBloc, ProfileSwitcherState>(
          builder: (context, state) {
            if (state is ProfileSwitcherLoading ||
                state is ProfileSwitcherInitial) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
            if (state is ProfileSwitcherError) {
              return Scaffold(body: Center(child: Text(state.message)));
            }
            if (state is ProfileSwitcherLoaded) {
              final account = state.account;
              return Scaffold(
                appBar: AppBar(title: const Text('Select Profile')),
                body: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text('Your Profiles',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ...account.profiles.map((profile) => ListTile(
                      title: Text(profile.name),
                      subtitle: Text(profile.type.name),
                      trailing: profile.id == account.activeProfileId
                          ? const Icon(Icons.check, color: Colors.green)
                          : null,
                      onTap: () {
                        context
                            .read<ProfileSwitcherBloc>()
                            .add(SwitchProfile(profile.id));
                        // Navigation is now handled by the BlocListener
                      },
                    )),
                    const Divider(),
                    const Text('Add New Profile',
                        style: TextStyle(fontSize: 16)),
                    Wrap(
                      spacing: 12,
                      children: ProfileType.values
                          .where((type) =>
                      !account.profiles.any((p) => p.type == type))
                          .map((type) => ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProfileSwitcherBloc>()
                              .add(AddProfile(type));
                        },
                        child: Text(type.name[0].toUpperCase() +
                            type.name.substring(1)),
                      ))
                          .toList(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Profiles:\n'
                            'Customer: Create/send/receive parcels\n'
                            'Driver: See and accept delivery requests\n'
                            'Assistant: Host parcels at your venue',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
