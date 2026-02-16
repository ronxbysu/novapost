import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'
    show
    MapController,
    TapPosition,
    InteractionOptions,
    InteractiveFlag,
    MapOptions,
    TileLayer,
    Marker,
    MarkerLayer,
    FlutterMap;
import 'package:http/http.dart' as http show get;
import 'package:latlong2/latlong.dart' show LatLng;

class DummyLocation {
  final String title;
  final String description;
  final LatLng position;

  const DummyLocation({
    required this.title,
    required this.description,
    required this.position,
  });
}

class MapAddressSelector extends StatefulWidget {
  final LatLng? initialPosition;
  final String title;

  const MapAddressSelector({
    Key? key,
    this.initialPosition,
    required this.title,
  }) : super(key: key);

  @override
  State<MapAddressSelector> createState() => _MapAddressSelectorState();
}

class _MapAddressSelectorState extends State<MapAddressSelector> {
  late MapController _mapController;

  // This state is from the old implementation and can be cleaned up.
  // LatLng _selectedPosition = LatLng(47.3769, 8.5417);
  // String _selectedAddress = '';
  // bool _isLoadingAddress = false;

  late DummyLocation _selectedLocation;
  // This state is from the old implementation and can be cleaned up.
  // int _currentCarouselIndex = 0;

  final List<DummyLocation> _dummyLocations = [
    const DummyLocation(
      title: 'Zurich Main Station',
      description: 'Central hub for trains and public transport.',
      position: LatLng(47.3779, 8.5403),
    ),
    const DummyLocation(
      title: 'Grossmünster',
      description: 'Iconic Romanesque-style Protestant church.',
      position: LatLng(47.3698, 8.5445),
    ),
    const DummyLocation(
      title: 'Swiss National Museum',
      description: 'Explore Swiss cultural history.',
      position: LatLng(47.3791, 8.5404),
    ),
    const DummyLocation(
      title: 'Opera House Zurich',
      description: 'Home to ballet, opera, and classical concerts.',
      position: LatLng(47.3653, 8.5473),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    // Initialize with the first location by default
    _selectedLocation = _dummyLocations.first;

    // If an initial position is provided, find the matching dummy location
    if (widget.initialPosition != null) {
      _selectedLocation = _dummyLocations.firstWhere(
              (loc) => loc.position == widget.initialPosition,
          orElse: () => _dummyLocations.first);
    }
  }

  void _confirmSelection() {
    Navigator.pop(context, {
      'address': '${_selectedLocation.title}, ${_selectedLocation.description}',
      'latLng': _selectedLocation.position,
    });
  }

  // This method is not used in the sliding panel implementation.
  /*
  Future<void> _getAddressFromLatLng(LatLng position) async {
    // ...
  }
  */

  // This method is not used in the sliding panel implementation.
  /*
  void _onMapTapped(TapPosition tapPosition, LatLng position) {
    // ...
  }
  */

  void _onLocationSelected(DummyLocation location) {
    // (1) Update the state to change the selected location
    setState(() {
      _selectedLocation = location;
    });

    // (2) Animate the map to focus on the new location
    _mapController.move(_selectedLocation.position, 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromRGBO(133, 108, 60, 1),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedLocation.position,
              initialZoom: 15.0,
              // onTap is removed to prevent conflicts with the bottom sheet logic
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.delivery_app',
                maxZoom: 19,
              ),
              MarkerLayer(
                // Show markers for all dummy locations
                markers: _dummyLocations.map((location) {
                  final isSelected = location.position == _selectedLocation.position;
                  return Marker(
                    point: location.position,
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.location_on,
                      size: 40,
                      // The selected marker is red, others are grey
                      color: isSelected ? Colors.red.shade700 : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'zoom_in',
                  onPressed: () {
                    final currentZoom = _mapController.camera.zoom;
                    _mapController.move(
                      _mapController.camera.center,
                      currentZoom + 1,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'zoom_out',
                  onPressed: () {
                    final currentZoom = _mapController.camera.zoom;
                    _mapController.move(
                      _mapController.camera.center,
                      currentZoom - 1,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.remove, color: Colors.black87),
                ),
              ],
            ),
          ),
          // The main UI is now the sliding panel, replacing the old bottom container
          _buildSlidingUpPanel(),
        ],
      ),
    );
  }

  Widget _buildSlidingUpPanel() {
    return DraggableScrollableSheet(
      initialChildSize: 0.75, // Panel starts at 75% of screen height
      minChildSize: 0.25,   // Can be dragged down to 25%
      maxChildSize: 0.75,   // Can't be dragged higher than 75%
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.black26,
              ),
            ],
          ),
          child: Column(
            children: [
              // Small grey "handle" indicator
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Expanded(
                // The scrollable list of locations
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _dummyLocations.length,
                  itemBuilder: (BuildContext context, int index) {
                    final location = _dummyLocations[index];
                    return _buildListItem(location);
                  },
                ),
              ),
              // Confirmation button at the bottom
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: ElevatedButton(
                  onPressed: _confirmSelection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(133, 108, 60, 1),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Confirm This Location',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Builds a single location item for the list in the bottom sheet.
  Widget _buildListItem(DummyLocation location) {
    final bool isSelected = location.title == _selectedLocation.title;
    return ListTile(
      leading: const Icon(Icons.location_city,
          color: Color.fromRGBO(133, 108, 60, 1)),
      title: Text(
        location.title,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
      subtitle: Text(location.description),
      onTap: () => _onLocationSelected(location),
      tileColor: isSelected ? Colors.grey.shade200 : null,
    );
  }
}
