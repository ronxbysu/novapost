# CLAUDE.md

# NovaPost - Package Delivery Application

> **Flutter-based delivery management application with BLoC state management**

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Project Structure](#project-structure)
4. [Features](#features)
5. [State Management](#state-management)
6. [Data Models](#data-models)
7. [Repositories](#repositories)
8. [UI Components](#ui-components)
9. [Setup & Installation](#setup--installation)
10. [API Integration](#api-integration)
11. [Usage Examples](#usage-examples)
12. [Testing](#testing)

---

## 📖 Project Overview

**NovaPost** is a comprehensive package delivery management application built with Flutter. It provides functionality for creating, tracking, and managing deliveries with a modern Instagram-inspired UI.

### Tech Stack

- **Framework:** Flutter 3.9.2+
- **State Management:** flutter_bloc 9.0.0
- **Architecture:** BLoC (Business Logic Component) Pattern
- **Maps:** OpenStreetMap (flutter_map 8.2.2)
- **Authentication:** Telegram OAuth
- **HTTP Client:** http 1.5.0

### Key Features

- ✅ Telegram-based authentication
- ✅ Create delivery orders with map-based address selection
- ✅ Track delivery status (pending, active, delivered)
- ✅ Instagram-style home feed
- ✅ Profile management
- ✅ Parcel filtering and search
- ✅ OpenStreetMap integration for address selection
- ✅ Real-time statistics dashboard

---

## 🏗️ Architecture

The application follows the **BLoC (Business Logic Component)** pattern for state management, providing clear separation between business logic and UI.

### Architecture Layers

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (UI Components, Pages, Widgets)    │
└─────────────┬───────────────────────┘
              │
┌─────────────▼───────────────────────┐
│       Business Logic Layer          │
│    (BLoC - Events, States)          │
└─────────────┬───────────────────────┘
              │
┌─────────────▼───────────────────────┐
│         Data Layer                  │
│  (Repositories, API Clients)        │
└─────────────────────────────────────┘
```

### Design Patterns

- **BLoC Pattern:** State management
- **Repository Pattern:** Data access abstraction
- **Provider Pattern:** Dependency injection
- **Observer Pattern:** BLoC state observation

---

## 📁 Project Structure

```
novapost/
├── lib/
│   ├── delivery/
│   │   ├── bloc/
│   │   │   ├── delivery_bloc.dart
│   │   │   ├── delivery_event.dart
│   │   │   └── delivery_state.dart
│   │   └── delivery_page.dart
│   │
│   ├── parcels/
│   │   ├── bloc/
│   │   │   ├── parcels_bloc.dart
│   │   │   ├── parcels_event.dart
│   │   │   └── parcels_state.dart
│   │   └── create_parcel_page.dart
│   │
│   ├── profile/
│   │   ├── bloc/
│   │   │   ├── profile_bloc.dart
│   │   │   ├── profile_event.dart
│   │   │   └── profile_state.dart
│   │   └── profile_page.dart
│   │
│   ├── home/
│   │   └── home_page.dart
│   │
│   ├── login_page.dart
│   └── main.dart
│
├── packages/
│   ├── auth_repository/
│   │   └── lib/
│   │       └── src/
│   │           └── auth_repository.dart
│   │
│   ├── delivery_repository/
│   │   └── lib/
│   │       ├── src/
│   │       │   ├── delivery_repository.dart
│   │       │   └── model/
│   │       │       └── delivery_model.dart
│   │       └── delivery_repository.dart
│   │
│   ├── parcel_repository/
│   │   └── lib/
│   │       ├── src/
│   │       │   ├── parcel_repository.dart
│   │       │   └── model/
│   │       │       └── models.dart
│   │       │       └── parcel_model.dart
│   │       └── parcel_repository.dart
│   │
│   └── telegram_repository/
│       └── lib/
│           └── src/
│               └── telegram_repository.dart
│
├── pubspec.yaml
└── README.md
```

---

## ✨ Features

### 1. Authentication
- **Telegram OAuth Integration**
- Token-based authentication
- Polling mechanism for login approval
- Deep linking support

**Implementation:** `lib/login_page.dart`

### 2. Delivery Management
- **Create Delivery:** Form with validation
- **Address Selection:** Interactive OpenStreetMap
- **Package Details:** Type, priority, description
- **Scheduling:** Date and time picker
- **Notes:** Optional delivery instructions

**Implementation:** `lib/delivery/delivery_page.dart`

### 3. Home Dashboard
- **Instagram-Style UI:** Profile header with gradient ring
- **Statistics Display:** Total, Active, Delivered counts
- **Recent Deliveries Grid:** Visual parcel overview
- **Quick Actions:** Create delivery, view notifications
- **Pull-to-Refresh:** Update data

**Implementation:** `lib/home/home_page.dart`

### 4. Parcels List
- **Filtering:** All, Active, Delivered, Pending
- **Chip Filters:** Easy status switching
- **Detailed Cards:** Status, recipient, address, date
- **Empty State:** User-friendly messaging

**Implementation:** `lib/home/home_page.dart` (ParcelsListPage)

### 5. Profile Management
- **View Profile:** Name, email, phone, location
- **Edit Profile:** Update user information
- **Avatar Display:** Profile picture
- **Logout:** Clear session

**Implementation:** `lib/profile/profile_page.dart`

### 6. Map Integration
- **OpenStreetMap:** Free, open-source maps
- **Address Selection:** Tap-to-select location
- **Reverse Geocoding:** Nominatim API
- **Zoom Controls:** Manual zoom in/out
- **Draggable Marker:** Fine-tune selection

**Implementation:** `lib/delivery/delivery_page.dart` (MapAddressSelector)

---

## 🎯 State Management

### BLoC Components

#### 1. DeliveryBloc

**Purpose:** Manages individual delivery operations

**Events:**
```dart
- CreateDelivery(Delivery delivery)
- LoadDelivery(Delivery delivery)
```

**States:**
```dart
- DeliveryInitial
- DeliveryLoading
- DeliveryLoaded(Delivery delivery)
- DeliveryError(String message)
```

**File:** `lib/delivery/bloc/delivery_bloc.dart`

#### 2. ParcelsBloc

**Purpose:** Manages list of parcels/deliveries

**Events:**
```dart
- LoadParcels()
- FilterParcels(String filter)
- RefreshParcels()
```

**States:**
```dart
- ParcelsInitial
- ParcelsLoading
- ParcelsLoaded(
    List<Delivery> parcels,
    List<Delivery> filteredParcels,
    String currentFilter
  )
- ParcelsError(String message)
```

**Features:**
- Auto-calculated statistics (totalCount, activeCount, deliveredCount, pendingCount)
- Client-side filtering
- Refresh capability

**File:** `lib/parcels/bloc/parcels_bloc.dart`

#### 3. ProfileBloc

**Purpose:** Manages user profile data

**Events:**
```dart
- LoadProfile()
- UpdateProfile(UserProfile profile)
- LogoutProfile()
```

**States:**
```dart
- ProfileInitial
- ProfileLoading
- ProfileLoaded(UserProfile profile)
- ProfileError(String message)
```

**File:** `lib/profile/bloc/profile_bloc.dart`

---

## 📊 Data Models

### Delivery Model

```dart
class Delivery extends Equatable {
   final String deliveryId;
   final String token;
   final String qrString;
   final String status;

   final List<Parcel> parcels;
}
```
**File:** `packages/delivery_repository/lib/src/model/delivery_model.dart`

### Parcel Model

```dart
class Parcel extends Equatable {
   final String parcelId;
   final String? boxId;
   final String senderEmail;
   final String receiverEmail;
   final String token;
   final String qrString;
   final String status;
}
```
**File:** `packages/parcel_repository/lib/src/model/parcel_model.dart`



### UserProfile Model

```dart
class UserProfile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatarUrl;
  final String role;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatarUrl,
    required this.role,
  });

  UserProfile copyWith({...});
  factory UserProfile.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
```

**File:** `lib/profile/models/user_profile.dart`

---

## 🗄️ Repositories

### AuthRepository

**Purpose:** Authentication and authorization

**Methods:**
```dart
Future<Map<String, String>> getAuthHeaders()
Future<User?> getCurrentUser()
Future<void> logout()
```

**File:** `packages/auth_repository/lib/src/auth_repository.dart`

### DeliveryRepository

**Purpose:** Delivery CRUD operations

**Methods:**
```dart
Future<Delivery> createDelivery(Delivery delivery)
Future<Delivery> getDelivery(Delivery delivery)
Future<Delivery> updateDelivery(Delivery delivery)
Future<Delivery> deleteDelivery(Delivery delivery)
Future<List<Delivery>> getAllDeliveries() // To be implemented
```

**File:** `packages/delivery_repository/lib/src/delivery_repository.dart`

### ParcelRepository

**Purpose:** Parcel CRUD operations

**Methods:**
```dart
Future<Parcel> createParcel(Parcel parcel);
Future<Parcel> getParcel(Parcel parcel);
Future<Parcel> updateParcel(Parcel parcel);
Future<Parcel> deleteParcel(Parcel parcel);

Future<List<Parcel>> getParcelList(String userId);
```

**File:** `packages/delivery_repository/lib/src/delivery_repository.dart`

### TelegramRepository

**Purpose:** Telegram OAuth integration

**Methods:**
```dart
Future<(String, Uri, int)> initiateLogin()
Future<bool> checkLoginApproved(String token)
Future<void> fetchAccessToken(String token)
```

**File:** `packages/telegram_repository/lib/src/telegram_repository.dart`

---

## 🎨 UI Components

### HomePage

**Features:**
- Instagram-style profile header
- Statistics display with tap navigation
- Recent deliveries grid
- Pull-to-refresh
- Floating action button for new delivery

**BLoC Integration:**
- Uses `ParcelsBloc` for data
- Uses `ProfileBloc` for user info
- Provides `ParcelsBloc` locally (scoped to page)

**Navigation:**
- Tap avatar → ProfilePage
- Tap stat → ParcelsListPage (filtered)
- Tap FAB → CreateDeliveryPage

### CreateDeliveryPage

**Form Fields:**
- Recipient name (text)
- Recipient phone (validated)
- Pickup address (map selection)
- Delivery address (map selection)
- Package description (text)
- Package type (dropdown: Small, Medium, Large, Extra Large)
- Priority (dropdown: Standard, Express, Urgent)
- Delivery date (date picker)
- Delivery time (time picker)
- Notes (optional text)

**BLoC Integration:**
- Uses `DeliveryBloc` for submission
- Shows loading state during creation
- Success/error snackbar feedback

**Map Integration:**
- OpenStreetMap tile layer
- Tap-to-select location
- Reverse geocoding via Nominatim
- Draggable marker
- Zoom controls

### ParcelsListPage

**Features:**
- Filter chips (All, Active, Delivered, Pending)
- Card-based list view
- Status indicators with color coding
- Empty state handling

**BLoC Integration:**
- Shares `ParcelsBloc` from HomePage
- Reactive filtering
- Real-time updates

### ProfilePage

**Features:**
- Avatar display with edit button
- Information cards (email, phone, location, ID)
- Edit profile dialog
- Logout confirmation

**BLoC Integration:**
- Uses global `ProfileBloc`
- Edit functionality with state updates
- Logout action

---

## 🚀 Setup & Installation

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation Steps

1. **Clone the repository**
```bash
git clone <repository-url>
cd novapost
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure base URL**
   Edit `lib/main.dart`:
```dart
final baseUrl = 'https://your-api-url.com';
```

4. **Run the application**
```bash
flutter run
```

### Dependencies

**Main Dependencies:**
```yaml
dependencies:
  flutter_bloc: ^9.0.0
  equatable: ^2.0.5
  flutter_map: ^8.2.2
  latlong2: ^0.9.0
  http: ^1.5.0
  url_launcher: ^6.3.0
  provider: ^6.1.5
```

**Dev Dependencies:**
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  bloc_test: ^9.1.0     # For testing
  mocktail: ^1.0.0      # For testing
```

---

## 🌐 API Integration

### Current Status

The application uses **mock data** in BLoCs. To connect to real API:

### 1. Update DeliveryRepository

Add `getAllDeliveries` method:

```dart
@override
Future<List<Delivery>> getAllDeliveries() async {
  final headers = await authRepository.getAuthHeaders();
  final response = await http.get(
    Uri.parse('$baseUrl/deliveries/'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Delivery.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load deliveries');
  }
}
```

### 2. Update ParcelsBloc

Replace mock data in `_onLoadParcels`:

```dart
Future<void> _onLoadParcels(LoadParcels event, Emitter<ParcelsState> emit) async {
  emit(ParcelsLoading());
  try {
    final parcels = await deliveryRepository.getAllDeliveries();
    emit(ParcelsLoaded(parcels: parcels, filteredParcels: parcels));
  } catch (e) {
    emit(ParcelsError(e.toString()));
  }
}
```

### 3. Update ProfileBloc

Replace mock data in `_onLoadProfile`:

```dart
Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
  emit(ProfileLoading());
  try {
    final userData = await authRepository.getCurrentUser();
    final profile = UserProfile.fromJson(userData.toJson());
    emit(ProfileLoaded(profile));
  } catch (e) {
    emit(ProfileError(e.toString()));
  }
}
```

### API Endpoints Expected

```
POST   /deliveries          - Create delivery
GET    /deliveries          - Get all deliveries
GET    /deliveries/:id      - Get delivery by ID
PUT    /deliveries/:id      - Update delivery
DELETE /deliveries/:id      - Delete delivery

GET    /auth/user           - Get current user
POST   /auth/login          - Login
POST   /auth/logout         - Logout

POST   /telegram/initiate   - Start Telegram login
GET    /telegram/check/:token - Check login status
POST   /telegram/token      - Get access token
```

### Response Formats

**Delivery:**
```json
{
  "delivery_id": "PKG1001",
  "box_id": "BOX123",
  "sender_email": "sender@example.com",
  "receiver_email": "receiver@example.com",
  "token": "abc123",
  "qr_string": "QR_CODE_DATA",
  "status": "active"
}
```

**User:**
```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "+1234567890",
  "location": "New York, USA",
  "avatar_url": "https://...",
  "role": "Delivery Manager"
}
```

---

## 💡 Usage Examples

### Creating a Parcel

```dart
// Navigate to create delivery page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const CreateParcelPage(),
  ),
).then((_) {
  // Refresh parcels list after creation
  context.read<ParcelsBloc>().add(RefreshParcels());
});
```

### Filtering Parcels

```dart
// Filter by status
context.read<ParcelsBloc>().add(FilterParcels('active'));

// Reset to all parcels
context.read<ParcelsBloc>().add(FilterParcels('all'));
```

### Loading User Profile

```dart
// In ProfilePage
BlocProvider(
  create: (context) => ProfileBloc(
    context.read<AuthRepository>(),
  )..add(LoadProfile()),
  child: const ProfilePageView(),
)
```

### Updating Profile

```dart
// Update profile data
final updatedProfile = currentProfile.copyWith(
  name: 'New Name',
  phone: '+9876543210',
);
context.read<ProfileBloc>().add(UpdateProfile(updatedProfile));
```

### Listening for State Changes

```dart
BlocListener<DeliveryBloc, DeliveryState>(
  listener: (context, state) {
    if (state is DeliveryLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Delivery created!')),
      );
      Navigator.pop(context);
    } else if (state is DeliveryError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${state.message}')),
      );
    }
  },
  child: YourWidget(),
)
```

---

## 🧪 Testing

### Unit Testing BLoCs

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeliveryRepository extends Mock implements DeliveryRepository {}

void main() {
  late ParcelsBloc parcelsBloc;
  late MockDeliveryRepository repository;

  setUp(() {
    repository = MockDeliveryRepository();
    parcelsBloc = ParcelsBloc(repository);
  });

  tearDown(() {
    parcelsBloc.close();
  });

  group('ParcelsBloc', () {
    final mockParcels = [
      const Delivery(
        deliveryId: 'TEST001',
        senderEmail: 'test@test.com',
        receiverEmail: 'user@test.com',
        token: 'token',
        qrString: 'qr',
        status: 'active',
      ),
    ];

    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsLoaded] when LoadParcels succeeds',
      build: () {
        when(() => repository.getAllDeliveries())
            .thenAnswer((_) async => mockParcels);
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        ParcelsLoaded(parcels: mockParcels, filteredParcels: mockParcels),
      ],
    );

    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsError] when LoadParcels fails',
      build: () {
        when(() => repository.getAllDeliveries())
            .thenThrow(Exception('Network error'));
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        isA<ParcelsError>(),
      ],
    );

    blocTest<ParcelsBloc, ParcelsState>(
      'filters parcels correctly',
      build: () => parcelsBloc,
      seed: () => ParcelsLoaded(
        parcels: mockParcels,
        filteredParcels: mockParcels,
      ),
      act: (bloc) => bloc.add(FilterParcels('active')),
      expect: () => [
        isA<ParcelsLoaded>()
            .having((s) => s.filteredParcels.length, 'filtered count', 1)
            .having((s) => s.currentFilter, 'current filter', 'active'),
      ],
    );
  });
}
```

### Widget Testing

```dart
void main() {
  testWidgets('HomePage displays loading indicator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => MockParcelsBloc(),
          child: const HomePage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HomePage displays parcels when loaded', (tester) async {
    final mockBloc = MockParcelsBloc();
    when(() => mockBloc.state).thenReturn(
      ParcelsLoaded(parcels: mockParcels, filteredParcels: mockParcels),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: mockBloc,
          child: const HomePage(),
        ),
      ),
    );

    expect(find.text('24'), findsOneWidget); // Total count
  });
}
```

### Integration Testing

```dart
void main() {
  testWidgets('Complete delivery creation flow', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to create delivery
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Fill form
    await tester.enterText(
      find.byType(TextFormField).first,
      'John Doe',
    );

    // Submit form
    await tester.tap(find.text('Create Delivery'));
    await tester.pumpAndSettle();

    // Verify success
    expect(find.text('Delivery created successfully!'), findsOneWidget);
  });
}
```

---

## 📝 Code Style & Conventions

### Naming Conventions

- **Files:** snake_case (e.g., `delivery_bloc.dart`)
- **Classes:** PascalCase (e.g., `DeliveryBloc`)
- **Variables:** camelCase (e.g., `deliveryRepository`)
- **Constants:** lowerCamelCase (e.g., `baseUrl`)
- **Private:** Prefix with _ (e.g., `_onLoadParcels`)

### BLoC Conventions

- **Events:** Verb-based (e.g., `LoadParcels`, `CreateDelivery`)
- **States:** Noun-based (e.g., `ParcelsLoaded`, `DeliveryError`)
- **Files:** Use `part of` for events and states

### Widget Conventions

- Use `const` constructors where possible
- Extract reusable widgets into separate methods
- Keep build methods small and readable

---

## 🐛 Known Issues & TODO

### Current Limitations

- [ ] Mock data used in BLoCs (needs API integration)
- [ ] No offline support / caching
- [ ] No image upload for packages
- [ ] No real-time tracking
- [ ] No push notifications

### TODO List

- [ ] Implement real API integration
- [ ] Add unit tests for all BLoCs
- [ ] Add widget tests for all pages
- [ ] Add integration tests for main flows
- [ ] Implement caching layer
- [ ] Add error retry mechanisms
- [ ] Implement offline mode
- [ ] Add push notifications
- [ ] Add image upload for packages
- [ ] Add real-time delivery tracking
- [ ] Implement search functionality
- [ ] Add delivery history export

---

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Library](https://bloclibrary.dev/)
- [Flutter Map Documentation](https://docs.fleaflet.dev/)
- [Equatable Package](https://pub.dev/packages/equatable)
- [Provider Package](https://pub.dev/packages/provider)

---

## 👥 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📞 Contact

For questions or support, please contact the development team.

---

**Last Updated:** October 4, 2025  
**Version:** 1.0.0  
**Flutter Version:** 3.9.2  
**Dart Version:** 3.8.1