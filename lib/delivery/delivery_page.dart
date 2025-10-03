import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class CreateDeliveryPage extends StatefulWidget {
  const CreateDeliveryPage({super.key});

  @override
  State<CreateDeliveryPage> createState() => _CreateDeliveryPageState();
}

class _CreateDeliveryPageState extends State<CreateDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  final _recipientNameController = TextEditingController();
  final _recipientPhoneController = TextEditingController();
  final _pickupAddressController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _packageDescriptionController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedPriority = 'Standard';
  String _selectedPackageType = 'Small';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;

  LatLng? _pickupLatLng;
  LatLng? _deliveryLatLng;

  @override
  void dispose() {
    _recipientNameController.dispose();
    _recipientPhoneController.dispose();
    _pickupAddressController.dispose();
    _deliveryAddressController.dispose();
    _packageDescriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _selectAddressFromMap(bool isPickup) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapAddressSelector(
          initialPosition: isPickup ? _pickupLatLng : _deliveryLatLng,
          title: isPickup ? 'Select Pickup Location' : 'Select Delivery Location',
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        if (isPickup) {
          _pickupAddressController.text = result['address'];
          _pickupLatLng = result['latLng'];
        } else {
          _deliveryAddressController.text = result['address'];
          _deliveryLatLng = result['latLng'];
        }
      });
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a delivery date')),
        );
        return;
      }

      setState(() => _isLoading = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      final deliveryData = {
        'recipientName': _recipientNameController.text,
        'recipientPhone': _recipientPhoneController.text,
        'pickupAddress': _pickupAddressController.text,
        'pickupLatLng': _pickupLatLng != null
            ? {'lat': _pickupLatLng!.latitude, 'lng': _pickupLatLng!.longitude}
            : null,
        'deliveryAddress': _deliveryAddressController.text,
        'deliveryLatLng': _deliveryLatLng != null
            ? {'lat': _deliveryLatLng!.latitude, 'lng': _deliveryLatLng!.longitude}
            : null,
        'packageDescription': _packageDescriptionController.text,
        'packageType': _selectedPackageType,
        'priority': _selectedPriority,
        'deliveryDate': _selectedDate.toString(),
        'deliveryTime': _selectedTime?.format(context) ?? 'Not specified',
        'notes': _notesController.text,
      };

      setState(() => _isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delivery created successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context, deliveryData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Delivery'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionTitle('Recipient Information'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _recipientNameController,
              decoration: const InputDecoration(
                labelText: 'Recipient Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
              value?.isEmpty ?? true ? 'Name is required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _recipientPhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              validator: _validatePhone,
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Addresses'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _pickupAddressController,
              maxLines: 2,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Pickup Address',
                prefixIcon: const Icon(Icons.location_on),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.map, color: Colors.blue),
                  onPressed: () => _selectAddressFromMap(true),
                ),
                border: const OutlineInputBorder(),
                hintText: 'Tap map icon to select',
              ),
              validator: (value) =>
              value?.isEmpty ?? true ? 'Pickup address is required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deliveryAddressController,
              maxLines: 2,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                prefixIcon: const Icon(Icons.location_city),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.map, color: Colors.blue),
                  onPressed: () => _selectAddressFromMap(false),
                ),
                border: const OutlineInputBorder(),
                hintText: 'Tap map icon to select',
              ),
              validator: (value) =>
              value?.isEmpty ?? true ? 'Delivery address is required' : null,
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Package Details'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _packageDescriptionController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Package Description',
                prefixIcon: Icon(Icons.inventory_2),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
              value?.isEmpty ?? true ? 'Description is required' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPackageType,
              decoration: const InputDecoration(
                labelText: 'Package Type',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),
              items: ['Small', 'Medium', 'Large', 'Extra Large']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) =>
                  setState(() => _selectedPackageType = value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPriority,
              decoration: const InputDecoration(
                labelText: 'Priority',
                prefixIcon: Icon(Icons.priority_high),
                border: OutlineInputBorder(),
              ),
              items: ['Standard', 'Express', 'Urgent']
                  .map((priority) => DropdownMenuItem(
                value: priority,
                child: Text(priority),
              ))
                  .toList(),
              onChanged: (value) =>
                  setState(() => _selectedPriority = value!),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Schedule'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(
                      _selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Additional Notes (Optional)'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Notes',
                prefixIcon: Icon(Icons.note),
                border: OutlineInputBorder(),
                hintText: 'Any special instructions...',
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Text(
                'Create Delivery',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
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
  LatLng _selectedPosition = LatLng(47.3769, 8.5417); // Default: Zurich
  String _selectedAddress = '';
  bool _isLoadingAddress = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    if (widget.initialPosition != null) {
      _selectedPosition = widget.initialPosition!;
      _getAddressFromLatLng(_selectedPosition);
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    setState(() => _isLoadingAddress = true);

    try {
      // Using Nominatim (OpenStreetMap) reverse geocoding
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}&zoom=18&addressdetails=1'
      );

      final response = await http.get(
        url,
        headers: {'User-Agent': 'FlutterDeliveryApp/1.0'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _selectedAddress = data['display_name'] ?? 'Address not found';
        });
      } else {
        setState(() {
          _selectedAddress = 'Lat: ${position.latitude.toStringAsFixed(6)}, Lng: ${position.longitude.toStringAsFixed(6)}';
        });
      }
    } catch (e) {
      setState(() {
        _selectedAddress = 'Lat: ${position.latitude.toStringAsFixed(6)}, Lng: ${position.longitude.toStringAsFixed(6)}';
      });
    } finally {
      setState(() => _isLoadingAddress = false);
    }
  }

  void _onMapTapped(TapPosition tapPosition, LatLng position) {
    setState(() {
      _selectedPosition = position;
    });
    _getAddressFromLatLng(position);
  }

  void _confirmSelection() {
    Navigator.pop(context, {
      'address': _selectedAddress,
      'latLng': _selectedPosition,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedPosition,
              initialZoom: 15.0,
              onTap: _onMapTapped,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.delivery_app',
                maxZoom: 19,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _selectedPosition,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _isLoadingAddress
                            ? const Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 8),
                            Text('Loading address...'),
                          ],
                        )
                            : Text(
                          _selectedAddress.isEmpty
                              ? 'Tap on map to select location'
                              : _selectedAddress,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _selectedAddress.isEmpty ? null : _confirmSelection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Confirm Location',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}