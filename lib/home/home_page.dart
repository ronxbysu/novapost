import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/account/account_page.dart';
import 'package:novapost/parcels/create_parcel_page.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';
import 'package:novapost/profile/bloc/profile_bloc.dart';
import 'package:delivery_repository/delivery_repository.dart';
import 'package:profile_repository/profile_repository.dart'; // Import the repository

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // We will use MultiBlocProvider to provide both Blocs cleanly.
    return MultiBlocProvider(
      providers: [
        // Provider for ParcelsBloc
        BlocProvider(
          create: (context) => ParcelsBloc(
            context.read<ParcelRepository>(),
          )..add(LoadParcels()),
        ),
        // Provider for ProfileBloc that was missing
        BlocProvider(
          create: (context) => ProfileBloc(
            context.read<ProfileRepository>(),
          )..add(LoadProfile("")),  // TODO: fix empty profileId Assuming you have a LoadProfile event
        ),
      ],
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'NovaPost App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.manage_accounts_outlined), // Changed icon
            tooltip: 'Manage Account',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateParcelPage(),
                ),
              ).then((_) {
                // Refresh parcels after creating new delivery
                context.read<ParcelsBloc>().add(RefreshParcels());
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          if (state is ParcelsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ParcelsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ParcelsBloc>().add(LoadParcels());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is ParcelsLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ParcelsBloc>().add(RefreshParcels());
                // Wait for the state to change
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: ListView(
                children: [
                  // Instagram-style profile header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Avatar with ring
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, profileState) {
                            // Default value for avatarUrl
                            String avatarUrl = "https://i.pravatar.cc/150?img=12";
                            if (profileState is ProfileLoaded) {
                              // Use the real URL if the profile is loaded and avatar is not null
                              avatarUrl = profileState.profile.avatarUrl ?? avatarUrl;
                            }

                            return GestureDetector(
                              onTap: () {
                                // Assuming ProfilePage exists and is the correct destination
                                // If not, this should be AccountPage.route()
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.orange, Colors.pink],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(avatarUrl),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),
                        // Stats
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatColumn(
                                context,
                                'Total',
                                state.totalCount.toString(),
                                'all',
                              ),
                              _buildStatColumn(
                                context,
                                'Active',
                                state.activeCount.toString(),
                                'active',
                              ),
                              _buildStatColumn(
                                context,
                                'Delivered',
                                state.deliveredCount.toString(),
                                'delivered',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // User info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, profileState) {
                        final name = profileState is ProfileLoaded
                            ? profileState.profile.name
                            : 'John Doe';
                        final role = profileState is ProfileLoaded
                            ? profileState.profile.role
                            : 'Delivery Manager';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              role,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Action buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // Navigate to AccountPage to see profiles
                                    builder: (context) => const AccountPage()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            child: const Text(
                              'Share Profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1),
                  // Recent parcels section
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Recent Deliveries',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid of recent parcels
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: state.parcels.length > 9 ? 9 : state.parcels.length,
                    itemBuilder: (context, index) {
                      return _buildParcelGridItem(state.parcels[index]);
                    },
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text('No data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateParcelPage(),
            ),
          ).then((_) {
            context.read<ParcelsBloc>().add(RefreshParcels());
          });
        },
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatColumn(
      BuildContext context,
      String label,
      String count,
      String filter,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: context.read<ParcelsBloc>(),
              child: ParcelsListPage(filter: filter),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParcelGridItem(Parcel parcel) {
    final colors = [
      Colors.blue[100],
      Colors.green[100],
      Colors.orange[100],
      Colors.purple[100],
      Colors.red[100],
      Colors.teal[100],
    ];

    final colorIndex = parcel.parcelId.hashCode % colors.length;

    return Container(
      decoration: BoxDecoration(
        color: colors[colorIndex],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2,
            size: 40,
            color: colors[colorIndex]!.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Text(
            '#${parcel.parcelId}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ParcelsListPage extends StatelessWidget {
  final String filter;

  const ParcelsListPage({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    // Apply filter when page opens
    context.read<ParcelsBloc>().add(FilterParcels(filter));

    return Scaffold(
      appBar: AppBar(
        title: Text(_getFilterTitle(filter)),
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
        foregroundColor: Colors.white,
        actions: [
          // Add button to switch profiles
          IconButton(
            icon: const Icon(Icons.people_alt_outlined),
            tooltip: 'Switch Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          if (state is ParcelsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          // The rest of your ParcelsListPage...
          // You will need to add the rest of the list rendering logic here.
          if (state is ParcelsLoaded) {
            final filteredParcels = state.parcels.where((p) {
              if (filter == 'all') return true;
              if (filter == 'active') return p.status != 'delivered'; // Example logic
              if (filter == 'delivered') return p.status == 'delivered';
              return true;
            }).toList();

            return ListView.builder(
              itemCount: filteredParcels.length,
              itemBuilder: (context, index) {
                final parcel = filteredParcels[index];
                return ListTile(
                  title: Text('Parcel #${parcel.parcelId}'),
                  subtitle: Text(parcel.status),
                );
              },
            );
          }
          return const Center(child: Text("No parcels found for this filter."));
        },
      ),
    );
  }

  String _getFilterTitle(String filter) {
    switch (filter) {
      case 'active':
        return 'Active Parcels';
      case 'delivered':
        return 'Delivered Parcels';
      default:
        return 'All Parcels';
    }
  }
}
