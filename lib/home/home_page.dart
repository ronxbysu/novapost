import 'package:flutter/material.dart';
import 'package:novapost/delivery/delivery_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mock data
  final String userName = "John Doe";
  final String userAvatar = "https://i.pravatar.cc/150?img=12";
  final int totalParcels = 24;

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
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Instagram-style profile header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Avatar with ring
                GestureDetector(
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
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
                        backgroundImage: NetworkImage(userAvatar),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
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
                        totalParcels.toString(),
                        ParcelFilter.all,
                      ),
                      _buildStatColumn(
                        context,
                        'Active',
                        '8',
                        ParcelFilter.active,
                      ),
                      _buildStatColumn(
                        context,
                        'Delivered',
                        '16',
                        ParcelFilter.delivered,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Delivery Manager',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
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
            itemCount: 9,
            itemBuilder: (context, index) {
              return _buildParcelGridItem(index);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateDeliveryPage(),
            ),
          );
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
      ParcelFilter filter,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ParcelsListPage(filter: filter),
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

  Widget _buildParcelGridItem(int index) {
    final colors = [
      Colors.blue[100],
      Colors.green[100],
      Colors.orange[100],
      Colors.purple[100],
      Colors.red[100],
      Colors.teal[100],
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors[index % colors.length],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2,
            size: 40,
            color: colors[index % colors.length]!.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Text(
            '#PKG${1000 + index}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

enum ParcelFilter { all, active, delivered, pending }

class ParcelsListPage extends StatefulWidget {
  final ParcelFilter filter;

  const ParcelsListPage({Key? key, required this.filter}) : super(key: key);

  @override
  State<ParcelsListPage> createState() => _ParcelsListPageState();
}

class _ParcelsListPageState extends State<ParcelsListPage> {
  late ParcelFilter selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.filter;
  }

  String get filterTitle {
    switch (selectedFilter) {
      case ParcelFilter.all:
        return 'All Parcels';
      case ParcelFilter.active:
        return 'Active Parcels';
      case ParcelFilter.delivered:
        return 'Delivered Parcels';
      case ParcelFilter.pending:
        return 'Pending Parcels';
    }
  }

  List<Map<String, dynamic>> get filteredParcels {
    final allParcels = [
      {
        'id': 'PKG1001',
        'status': 'active',
        'recipient': 'Alice Johnson',
        'address': '123 Main St, New York',
        'date': '2025-10-05',
      },
      {
        'id': 'PKG1002',
        'status': 'delivered',
        'recipient': 'Bob Smith',
        'address': '456 Oak Ave, Boston',
        'date': '2025-10-03',
      },
      {
        'id': 'PKG1003',
        'status': 'active',
        'recipient': 'Carol White',
        'address': '789 Pine Rd, Chicago',
        'date': '2025-10-04',
      },
      {
        'id': 'PKG1004',
        'status': 'pending',
        'recipient': 'David Brown',
        'address': '321 Elm St, Seattle',
        'date': '2025-10-06',
      },
      {
        'id': 'PKG1005',
        'status': 'delivered',
        'recipient': 'Eve Davis',
        'address': '654 Maple Dr, Portland',
        'date': '2025-10-02',
      },
    ];

    if (selectedFilter == ParcelFilter.all) {
      return allParcels;
    }

    return allParcels
        .where((p) => p['status'] == selectedFilter.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final parcels = filteredParcels;

    return Scaffold(
      appBar: AppBar(
        title: Text(filterTitle),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Filter chips
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', ParcelFilter.all),
                  const SizedBox(width: 8),
                  _buildFilterChip('Active', ParcelFilter.active),
                  const SizedBox(width: 8),
                  _buildFilterChip('Delivered', ParcelFilter.delivered),
                  const SizedBox(width: 8),
                  _buildFilterChip('Pending', ParcelFilter.pending),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          // Parcels list
          Expanded(
            child: parcels.isEmpty
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
              itemCount: parcels.length,
              itemBuilder: (context, index) {
                final parcel = parcels[index];
                return _buildParcelCard(parcel);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, ParcelFilter filter) {
    final isSelected = selectedFilter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
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

  Widget _buildParcelCard(Map<String, dynamic> parcel) {
    Color statusColor;
    IconData statusIcon;

    switch (parcel['status']) {
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
                        parcel['id'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        parcel['status'].toString().toUpperCase(),
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
                Text(
                  parcel['recipient'],
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    parcel['address'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  parcel['date'],
                  style: const TextStyle(fontSize: 14),
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
            CircleAvatar(
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
