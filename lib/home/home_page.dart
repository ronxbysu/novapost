import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/delivery/delivery_page.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';
import 'package:novapost/profile/bloc/profile_bloc.dart';
import 'package:delivery_repository/delivery_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParcelsBloc(
        context.read<ParcelRepository>(),
      )..add(LoadParcels()),
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
          'Delivery App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateDeliveryPage(),
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
                            final avatarUrl = profileState is ProfileLoaded
                                ? profileState.profile.avatarUrl
                                : "https://i.pravatar.cc/150?img=12";

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePage(),
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
                                  builder: (context) => const ProfilePage(),
                                ),
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
              builder: (context) => const CreateDeliveryPage(),
            ),
          ).then((_) {
            context.read<ParcelsBloc>().add(RefreshParcels());
          });
        },
        backgroundColor: Colors.blue,
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

  const ParcelsListPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Apply filter when page opens
    context.read<ParcelsBloc>().add(FilterParcels(filter));

    return Scaffold(
      appBar: AppBar(
        title: Text(_getFilterTitle(filter)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          if (state is ParcelsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ParcelsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          if (state is ParcelsLoaded) {
            return Column(
              children: [
                // Filter chips
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip(context, 'All', 'all', state.currentFilter),
                        const SizedBox(width: 8),
                        _buildFilterChip(context, 'Active', 'active', state.currentFilter),
                        const SizedBox(width: 8),
                        _buildFilterChip(context, 'Delivered', 'delivered', state.currentFilter),
                        const SizedBox(width: 8),
                        _buildFilterChip(context, 'Pending', 'pending', state.currentFilter),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1),
                // Parcels list
                Expanded(
                  child: state.filteredParcels.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No parcels found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.filteredParcels.length,
                    itemBuilder: (context, index) {
                      final parcel = state.filteredParcels[index];
                      return _buildParcelCard(parcel);
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text('No data'));
        },
      ),
    );
  }

  String _getFilterTitle(String filter) {
    switch (filter) {
      case 'all':
        return 'All Parcels';
      case 'active':
        return 'Active Parcels';
      case 'delivered':
        return 'Delivered Parcels';
      case 'pending':
        return 'Pending Parcels';
      default:
        return 'Parcels';
    }
  }

  Widget _buildFilterChip(BuildContext context, String label, String filter, String currentFilter) {
    final isSelected = currentFilter == filter;
    return GestureDetector(
      onTap: () {
        context.read<ParcelsBloc>().add(FilterParcels(filter));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildParcelCard(Parcel parcel) {
    Color statusColor;
    IconData statusIcon;

    switch (parcel.status) {
      case 'active':
        statusColor = Colors.orange;
        statusIcon = Icons.local_shipping;
        break;
      case 'delivered':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'pending':
        statusColor = Colors.blue;
        statusIcon = Icons.schedule;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.inventory_2;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(statusIcon, color: statusColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        parcel.parcelId,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        parcel.status.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    parcel.receiverEmail,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.mail_outline, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'From: ${parcel.senderEmail}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1 234 567 8900'),
            ),
            const ListTile(
              leading: Icon(Icons.location_city),
              title: Text('New York, USA'),
            ),
          ],
        ),
      ),
    );
  }
}