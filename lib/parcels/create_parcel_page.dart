import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/map_address_selector.dart';

class CreateParcelPage extends StatefulWidget {
  const CreateParcelPage({super.key});

  @override
  State<CreateParcelPage> createState() => _CreateParcelPageState();
}

class _CreateParcelPageState extends State<CreateParcelPage> {
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
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
                  icon: const Icon(Icons.map, color: Color.fromRGBO(133, 108, 60, 1)),
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
                  icon: const Icon(Icons.map, color: Color.fromRGBO(133, 108, 60, 1)),
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
                backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
