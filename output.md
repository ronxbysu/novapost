Project Tree:
```
├── lib/
│   ├── delivery/
│   │   └── bloc/
│   │       ├── delivery_bloc.dart
│   │       ├── delivery_event.dart
│   │       └── delivery_state.dart
│   ├── design/
│   │   ├── deliveries.dart
│   │   └── excecutors.dart
│   ├── home/
│   │   └── home_page.dart
│   ├── login_page.dart
│   ├── main.dart
│   ├── parcels/
│   │   ├── bloc/
│   │   │   ├── parcels_bloc.dart
│   │   │   ├── parcels_event.dart
│   │   │   └── parcels_state.dart
│   │   └── create_parcel_page.dart
│   ├── profile/
│   │   ├── bloc/
│   │   │   ├── profile_bloc.dart
│   │   │   ├── profile_event.dart
│   │   │   └── profile_state.dart
│   │   └── profile_page.dart
│   ├── profile_switcher/
│   │   ├── bloc/
│   │   │   ├── profile_switcher_bloc.dart
│   │   │   ├── profile_switcher_event.dart
│   │   │   └── profile_switcher_state.dart
│   │   └── profile_switcher_page.dart
│   └── widgets/
│       └── map_address_selector.dart
├── packages/
│   ├── account_repository/
│   │   └── lib/
│   │       ├── account_repository.dart
│   │       └── src/
│   │           ├── account_repository.dart
│   │           └── model/
│   │               ├── account_model.dart
│   │               └── models.dart
│   ├── delivery_repository/
│   │   └── lib/
│   │       ├── delivery_repository.dart
│   │       └── src/
│   │           ├── delivery_repository.dart
│   │           └── model/
│   │               ├── delivery_model.dart
│   │               └── models.dart
│   ├── parcel_repository/
│   │   └── lib/
│   │       ├── parcel_repository.dart
│   │       └── src/
│   │           ├── model/
│   │           │   ├── models.dart
│   │           │   └── parcel_model.dart
│   │           └── parcel_repository.dart
│   └── profile_repository/
│       └── lib/
│           ├── profile_repository.dart
│           └── src/
│               ├── model/
│               │   ├── models.dart
│               │   └── profile_model.dart
│               └── profile_repository.dart
└── test/
    ├── home/
    │   └── home_page_test.dart
    ├── parcels/
    │   └── bloc/
    │       └── parcels_bloc_test.dart
    └── widget_test.dart
```

# File: lib/delivery/bloc/delivery_bloc.dart
```text
import 'package:delivery_repository/delivery_repository.dart' show Delivery, DeliveryRepository;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> with ChangeNotifier {
  final DeliveryRepository deliveryRepository;

  DeliveryBloc(this.deliveryRepository) : super(DeliveryInitial()) {
    on<CreateDelivery>(_onCreateDelivery);
    on<LoadDelivery>(_onLoadDelivery);
  }

  Future<void> _onCreateDelivery(CreateDelivery event, Emitter<DeliveryState> emit) async {
    emit(DeliveryLoading());
    try {
    final delivery = await deliveryRepository.createDelivery(event.delivery);
    emit(DeliveryLoaded(delivery));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }

  Future<void> _onLoadDelivery(LoadDelivery event, Emitter<DeliveryState> emit) async {
    emit(DeliveryLoading());
    try {
      final delivery = await deliveryRepository.getDelivery(event.delivery);
      emit(DeliveryLoaded(delivery));
    } catch (e) {
      emit(DeliveryError(e.toString()));
    }
  }
}
```
# End of file: lib/delivery/bloc/delivery_bloc.dart

# File: lib/delivery/bloc/delivery_event.dart
```text
part of 'delivery_bloc.dart';

abstract class DeliveryEvent extends Equatable {
  const DeliveryEvent();
}

class CreateDelivery extends DeliveryEvent {
  final Delivery delivery;

  const CreateDelivery({required this.delivery});

  @override
  List<Object?> get props => [delivery];
}

class LoadDelivery extends DeliveryEvent {
  final Delivery delivery;

  const LoadDelivery({required this.delivery});

  @override
  List<Object?> get props => [delivery];
}
```
# End of file: lib/delivery/bloc/delivery_event.dart

# File: lib/delivery/bloc/delivery_state.dart
```text
part of 'delivery_bloc.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object?> get props => [];
}

class DeliveryInitial extends DeliveryState {}
class DeliveryLoading extends DeliveryState {}
class DeliveryLoaded extends DeliveryState {
  final Delivery delivery;
  const DeliveryLoaded(this.delivery);

  @override
  List<Object?> get props => [delivery];
}
class DeliveryError extends DeliveryState {
  final String message;
  const DeliveryError(this.message);

  @override
  List<Object?> get props => [message];
}
```
# End of file: lib/delivery/bloc/delivery_state.dart

# File: lib/design/deliveries.dart
```text
import 'package:flutter/material.dart';
class Frame1707480319 extends StatefulWidget {
  const Frame1707480319({super.key});
  @override
  Frame1707480319State createState() => Frame1707480319State();
}
class Frame1707480319State extends State<Frame1707480319> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFFFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x40C6C6C6),
                                              blurRadius: 10,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.only( bottom: 16),
                                        width: double.infinity,
                                        child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                  ),
                                                  color: Color(0xFF06B40D),
                                                ),
                                                margin: const EdgeInsets.only( right: 12),
                                                width: 6,
                                                height: 114,
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                child: IntrinsicHeight(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          IntrinsicHeight(
                                                            child: Container(
                                                              margin: const EdgeInsets.only( bottom: 14),
                                                              width: double.infinity,
                                                              child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 30,
                                                                        height: 30,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/90y38eup_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                    Text(
                                                                      "Confirmed",
                                                                      style: TextStyle(
                                                                        color: Color(0xFF06B40D),
                                                                        fontSize: 14,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 24,
                                                                        height: 24,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/6fltru93_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                  ]
                                                              ),
                                                            ),
                                                          ),
                                                          IntrinsicHeight(
                                                            child: Container(
                                                              margin: const EdgeInsets.symmetric(horizontal: 10),
                                                              width: double.infinity,
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: IntrinsicHeight(
                                                                        child: Container(
                                                                          margin: const EdgeInsets.only( right: 12),
                                                                          width: double.infinity,
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                IntrinsicHeight(
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.only( bottom: 8),
                                                                                    width: double.infinity,
                                                                                    child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                              margin: const EdgeInsets.only( right: 12),
                                                                                              width: 20,
                                                                                              height: 20,
                                                                                              child: Image.network(
                                                                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/eomgu9ei_expires_30_days.png",
                                                                                                fit: BoxFit.fill,
                                                                                              )
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: SizedBox(
                                                                                              width: double.infinity,
                                                                                              child: Text(
                                                                                                "Wendsday - Jun 21, 2024",
                                                                                                style: TextStyle(
                                                                                                  color: Color(0xFF1A1A1B),
                                                                                                  fontSize: 14,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                IntrinsicHeight(
                                                                                  child: SizedBox(
                                                                                    width: double.infinity,
                                                                                    child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                              margin: const EdgeInsets.only( right: 12),
                                                                                              width: 20,
                                                                                              height: 20,
                                                                                              child: Image.network(
                                                                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/vueqnltx_expires_30_days.png",
                                                                                                fit: BoxFit.fill,
                                                                                              )
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: SizedBox(
                                                                                              width: double.infinity,
                                                                                              child: Text(
                                                                                                "8:15 AM - 8:45 AM (+03)",
                                                                                                style: TextStyle(
                                                                                                  color: Color(0xFF1A1A1B),
                                                                                                  fontSize: 14,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 50,
                                                                        height: 50,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/usl8436f_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                  ]
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFFFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x40C6C6C6),
                                              blurRadius: 10,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        width: double.infinity,
                                        child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                  ),
                                                  color: Color(0xFFD64038),
                                                ),
                                                margin: const EdgeInsets.only( right: 12),
                                                width: 6,
                                                height: 114,
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                child: IntrinsicHeight(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          IntrinsicHeight(
                                                            child: Container(
                                                              margin: const EdgeInsets.only( bottom: 14),
                                                              width: double.infinity,
                                                              child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 30,
                                                                        height: 30,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/xpq29gko_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                    Text(
                                                                      "Declined",
                                                                      style: TextStyle(
                                                                        color: Color(0xFFBB0707),
                                                                        fontSize: 14,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 24,
                                                                        height: 24,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/8ftt8z2y_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                  ]
                                                              ),
                                                            ),
                                                          ),
                                                          IntrinsicHeight(
                                                            child: Container(
                                                              margin: const EdgeInsets.symmetric(horizontal: 10),
                                                              width: double.infinity,
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: IntrinsicHeight(
                                                                        child: Container(
                                                                          margin: const EdgeInsets.only( right: 12),
                                                                          width: double.infinity,
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                IntrinsicWidth(
                                                                                  child: IntrinsicHeight(
                                                                                    child: Container(
                                                                                      margin: const EdgeInsets.only( bottom: 8),
                                                                                      child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                                margin: const EdgeInsets.only( right: 12),
                                                                                                width: 20,
                                                                                                height: 20,
                                                                                                child: Image.network(
                                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/i9ooj5dr_expires_30_days.png",
                                                                                                  fit: BoxFit.fill,
                                                                                                )
                                                                                            ),
                                                                                            Text(
                                                                                              "Wendsday - Jun 21, 2024",
                                                                                              style: TextStyle(
                                                                                                color: Color(0xFF1A1A1B),
                                                                                                fontSize: 14,
                                                                                              ),
                                                                                            ),
                                                                                          ]
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                IntrinsicHeight(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                              margin: const EdgeInsets.only( right: 12),
                                                                                              width: 20,
                                                                                              height: 20,
                                                                                              child: Image.network(
                                                                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/s4scenz4_expires_30_days.png",
                                                                                                fit: BoxFit.fill,
                                                                                              )
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              child: Text(
                                                                                                "10:15 AM - 10:45 AM (+03)",
                                                                                                style: TextStyle(
                                                                                                  color: Color(0xFF1A1A1B),
                                                                                                  fontSize: 14,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 50,
                                                                        height: 50,
                                                                        child: Image.network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/joy6lk3s_expires_30_days.png",
                                                                          fit: BoxFit.fill,
                                                                        )
                                                                    ),
                                                                  ]
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
# End of file: lib/design/deliveries.dart

# File: lib/design/excecutors.dart
```text
import 'package:flutter/material.dart';
class Executors extends StatefulWidget {
  const Executors({super.key});
  @override
  ExecutorsState createState() => ExecutorsState();
}
class ExecutorsState extends State<Executors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only( top: 239),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(28),
                                                    topRight: Radius.circular(28),
                                                  ),
                                                  color: Color(0xFFFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x668E8585),
                                                      blurRadius: 3,
                                                      offset: Offset(0, -1),
                                                    ),
                                                  ],
                                                ),
                                                padding: const EdgeInsets.all(16),
                                                width: double.infinity,
                                                child: Column(
                                                    children: [
                                                      IntrinsicWidth(
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            margin: const EdgeInsets.only( bottom: 32),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      color: Color(0xFF8C8C9A),
                                                                    ),
                                                                    width: 32,
                                                                    height: 4,
                                                                    child: SizedBox(),
                                                                  ),
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( top: 1, right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/n6fmgw9t_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 11),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Vasily Ivanov",
                                                                              style: TextStyle(
                                                                                color: Color(0xFF1A1A1B),
                                                                                fontSize: 14,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.only( bottom: 4, right: 16),
                                                                              child: Text(
                                                                                "Since 2023г",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF8C8C9A),
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/m40kkjpo_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/khdlxcan_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    child: SizedBox(),
                                                                  ),
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          IntrinsicHeight(
                                                                            child: Container(
                                                                              margin: const EdgeInsets.only( bottom: 20),
                                                                              child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Container(
                                                                                      margin: const EdgeInsets.only( right: 3),
                                                                                      child: Text(
                                                                                        "6 км",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 12,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ]
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          IntrinsicWidth(
                                                                            child: IntrinsicHeight(
                                                                              child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                        margin: const EdgeInsets.only( right: 12),
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/hfz2eey2_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                    Container(
                                                                                        margin: const EdgeInsets.only( right: 12),
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/ckpnj08e_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                    Container(
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/600o16q3_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                  ]
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/cyrxpu94_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/2molfuho_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/6xhviuuf_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/5z2e1h0g_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/xsjq9nrn_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/zfbu3jfe_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/klanknvw_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b5leni81_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/c1o12am0_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/yynztepl_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/79bztsn1_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/8lnjqh8j_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/cw3j2f95_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/m0ms6j18_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/27o256fq_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/glo14axx_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/nhs97h71_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/dqaygy83_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/fst2ver3_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/lot86dpy_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/311qore4_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b5rjkzd2_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/01quxb03_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/20dfdqh2_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      height: 322,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          height: 322,
                                          width: double.infinity,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(40),
                                              child: Image.network(
                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b65eebf0_expires_30_days.png",
                                                fit: BoxFit.fill,
                                              )
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
# End of file: lib/design/excecutors.dart

# File: lib/home/home_page.dart
```text
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/parcels/create_parcel_page.dart';
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

  const ParcelsListPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Apply filter when page opens
    context.read<ParcelsBloc>().add(FilterParcels(filter));

    return Scaffold(
      appBar: AppBar(
        title: Text(_getFilterTitle(filter)),
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
          color: isSelected ? Color.fromRGBO(133, 108, 60, 1) : Colors.grey[200],
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
        statusColor = Color.fromRGBO(133, 108, 60, 1);
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
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
```
# End of file: lib/home/home_page.dart

# File: lib/login_page.dart
```text

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telegram_repository/telegram_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _status;
  Timer? _poll;

  TelegramRepository telegramRepository = TelegramRepositoryImpl(baseUrl: '');


  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _startTelegramLogin() async {
    setState(() => _status = 'Requesting login token...');

    (String token, Uri tgUri, int code) tgTokenUriRecord = await telegramRepository.initiateLogin();

    setState(() => _status = 'Opening Telegram...');


    String token = tgTokenUriRecord.$1;
    Uri uri = tgTokenUriRecord.$2;

    if (token.isEmpty) return;

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      setState(() => _status = 'Could not open Telegram.');
      return;
    }

    // Start polling for approval
    _poll?.cancel();
    _poll = Timer.periodic(const Duration(seconds: 2), (_) async {
      bool isLoginApproved = await telegramRepository.checkLoginApproved(token);
      if (isLoginApproved) {
        _poll?.cancel();
        await telegramRepository.fetchAccessToken(token);
      } else {
        _poll?.cancel();
      }
    });
    setState(() => _status = 'Waiting for approval in Telegram...');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with Telegram')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _startTelegramLogin,
                icon: const Icon(Icons.login),
                label: const Text('Login with Telegram'),
              ),
              const SizedBox(height: 16),
              if (_status != null) Text(_status!),
            ],
          ),
        ),
      ),
    );
  }
}
```
# End of file: lib/login_page.dart

# File: lib/main.dart
```text
import 'package:auth_repository/auth_repository.dart';
import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novapost/delivery/bloc/delivery_bloc.dart';
import 'package:novapost/home/home_page.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:provider/provider.dart';

import 'parcels/create_parcel_page.dart';
import 'login_page.dart';

void main() {
  final baseUrl = '';
  final authRepository = AuthRepositoryImpl(baseUrl: baseUrl);
  final profileRepository =  ProfileRepositoryImpl(authRepository: authRepository, baseUrl: baseUrl);
  final deliveryRepository = DeliveryRepositoryImpl(authRepository: authRepository, baseUrl: baseUrl);
  final parcelRepository = ParcelRepositoryImpl(authRepository: authRepository, baseUrl: baseUrl);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DeliveryBloc>(
          create: (_) => DeliveryBloc(deliveryRepository),
        ),
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<DeliveryRepository>.value(
              value: deliveryRepository,
            ),
            RepositoryProvider<AuthRepository>.value(
              value: authRepository,
            ),
            RepositoryProvider<ProfileRepository>.value(
              value: profileRepository,
            ),
            RepositoryProvider<ParcelRepository>.value(
              value: parcelRepository,
            ),
          ],
/*          child: MultiBlocProvider(
            providers: [
            ],
            child: NovaPostApp(),
          ),*/
          child: NovaPostApp(),
        ),
      ],
    ),
  );
}

class NovaPostApp extends StatelessWidget {
  const NovaPostApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'NovaPost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(133, 108, 60, 1),),
      ),
      home: const HomePage(),
    );
  }
}

```
# End of file: lib/main.dart

# File: lib/parcels/bloc/parcels_bloc.dart
```text
import 'package:delivery_repository/delivery_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'parcels_event.dart';
part 'parcels_state.dart';

class ParcelsBloc extends Bloc<ParcelsEvent, ParcelsState> {
  final ParcelRepository parcelRepository;

  ParcelsBloc(this.parcelRepository) : super(ParcelsInitial()) {
    on<LoadParcels>(_onLoadParcels);
    on<FilterParcels>(_onFilterParcels);
    on<RefreshParcels>(_onRefreshParcels);
  }

  Future<void> _onLoadParcels(LoadParcels event, Emitter<ParcelsState> emit) async {
    emit(ParcelsLoading());
    try {
      final parcels = await parcelRepository.getParcelList(""); //TODO: put user id here
      emit(ParcelsLoaded(parcels: parcels, filteredParcels: parcels));
    } catch (e) {
      emit(ParcelsError(e.toString()));
    }
  }

  Future<void> _onFilterParcels(FilterParcels event, Emitter<ParcelsState> emit) async {
    if (state is ParcelsLoaded) {
      final currentState = state as ParcelsLoaded;
      final filtered = _filterParcelsByStatus(currentState.parcels, event.filter);
      emit(currentState.copyWith(
        filteredParcels: filtered,
        currentFilter: event.filter,
      ));
    }
  }

  Future<void> _onRefreshParcels(RefreshParcels event, Emitter<ParcelsState> emit) async {
    add(LoadParcels());
  }

  List<Parcel> _filterParcelsByStatus(List<Parcel> parcels, String filter) {
    if (filter == 'all') {
      return parcels;
    }
    return parcels.where((p) => p.status == filter).toList();
  }
}

// lib/parcels/bloc/parcels_event.dart


// lib/parcels/bloc/parcels_state.dart
```
# End of file: lib/parcels/bloc/parcels_bloc.dart

# File: lib/parcels/bloc/parcels_event.dart
```text
part of 'parcels_bloc.dart';

abstract class ParcelsEvent extends Equatable {
  const ParcelsEvent();

  @override
  List<Object?> get props => [];
}

class LoadParcels extends ParcelsEvent {}

class FilterParcels extends ParcelsEvent {
  final String filter;

  const FilterParcels(this.filter);

  @override
  List<Object?> get props => [filter];
}

class RefreshParcels extends ParcelsEvent {}
```
# End of file: lib/parcels/bloc/parcels_event.dart

# File: lib/parcels/bloc/parcels_state.dart
```text
part of 'parcels_bloc.dart';

abstract class ParcelsState extends Equatable {
  const ParcelsState();

  @override
  List<Object?> get props => [];
}

class ParcelsInitial extends ParcelsState {}

class ParcelsLoading extends ParcelsState {}

class ParcelsLoaded extends ParcelsState {
  final List<Parcel> parcels;
  final List<Parcel> filteredParcels;
  final String currentFilter;

  const ParcelsLoaded({
    required this.parcels,
    required this.filteredParcels,
    this.currentFilter = 'all',
  });

  int get totalCount => parcels.length;
  int get activeCount => parcels.where((p) => p.status == 'active').length;
  int get deliveredCount => parcels.where((p) => p.status == 'delivered').length;
  int get pendingCount => parcels.where((p) => p.status == 'pending').length;

  ParcelsLoaded copyWith({
    List<Parcel>? parcels,
    List<Parcel>? filteredParcels,
    String? currentFilter,
  }) {
    return ParcelsLoaded(
      parcels: parcels ?? this.parcels,
      filteredParcels: filteredParcels ?? this.filteredParcels,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }

  @override
  List<Object?> get props => [parcels, filteredParcels, currentFilter];
}

class ParcelsError extends ParcelsState {
  final String message;

  const ParcelsError(this.message);

  @override
  List<Object?> get props => [message];
}
```
# End of file: lib/parcels/bloc/parcels_state.dart

# File: lib/parcels/create_parcel_page.dart
```text
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
```
# End of file: lib/parcels/create_parcel_page.dart

# File: lib/profile/bloc/profile_bloc.dart
```text
// lib/profile/bloc/profile_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:profile_repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<LogoutProfile>(_onLogoutProfile);
  }

  Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final profile = await profileRepository.getProfileById(event.profileId);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    if (state is ProfileLoaded) {
      emit(ProfileLoading());
      try {
        // Mock API call
        await Future.delayed(const Duration(seconds: 1));

        emit(ProfileLoaded(event.profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }

  Future<void> _onLogoutProfile(LogoutProfile event, Emitter<ProfileState> emit) async {
    try {
      // Add logout logic here
      emit(ProfileInitial());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
```
# End of file: lib/profile/bloc/profile_bloc.dart

# File: lib/profile/bloc/profile_event.dart
```text
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String profileId;

  const LoadProfile(this.profileId);

  @override
  List<Object?> get props => [profileId];
}

class UpdateProfile extends ProfileEvent {
  final Profile profile;

  const UpdateProfile(this.profile);

  @override
  List<Object?> get props => [profile];
}

class LogoutProfile extends ProfileEvent {}
```
# End of file: lib/profile/bloc/profile_event.dart

# File: lib/profile/bloc/profile_state.dart
```text
part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  const ProfileLoaded(this.profile);

  @override
  List<Object?> get props => [profile];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
```
# End of file: lib/profile/bloc/profile_state.dart

# File: lib/profile/profile_page.dart
```text
import 'package:flutter/material.dart';
import 'package:novapost/parcels/create_parcel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  builder: (context) => const CreateParcelPage(),
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
              builder: (context) => const CreateParcelPage(),
            ),
          );
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
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
          color: isSelected ? Color.fromRGBO(133, 108, 60, 1) : Colors.grey[200],
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
        statusColor = Color.fromRGBO(133, 108, 60, 1);
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
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color.fromRGBO(133, 108, 60, 1),
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
```
# End of file: lib/profile/profile_page.dart

# File: lib/profile_switcher/bloc/profile_switcher_bloc.dart
```text
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
```
# End of file: lib/profile_switcher/bloc/profile_switcher_bloc.dart

# File: lib/profile_switcher/bloc/profile_switcher_event.dart
```text
part of 'profile_switcher_bloc.dart';

abstract class ProfileSwitcherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAccount extends ProfileSwitcherEvent {}

class SwitchProfile extends ProfileSwitcherEvent {
  final String profileId;
  SwitchProfile(this.profileId);

  @override
  List<Object?> get props => [profileId];
}

class AddProfile extends ProfileSwitcherEvent {
  final ProfileType type;
  AddProfile(this.type);

  @override
  List<Object?> get props => [type];
}
```
# End of file: lib/profile_switcher/bloc/profile_switcher_event.dart

# File: lib/profile_switcher/bloc/profile_switcher_state.dart
```text
part of 'profile_switcher_bloc.dart';

abstract class ProfileSwitcherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileSwitcherInitial extends ProfileSwitcherState {}

class ProfileSwitcherLoading extends ProfileSwitcherState {}

class ProfileSwitcherLoaded extends ProfileSwitcherState {
  final Account account;
  ProfileSwitcherLoaded(this.account);

  @override
  List<Object?> get props => [account];
}

class ProfileSwitcherError extends ProfileSwitcherState {
  final String message;
  ProfileSwitcherError(this.message);

  @override
  List<Object?> get props => [message];
}
```
# End of file: lib/profile_switcher/bloc/profile_switcher_state.dart

# File: lib/profile_switcher/profile_switcher_page.dart
```text

import 'package:account_repository/account_repository.dart' show AccountRepository, ProfileType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/profile_switcher_bloc.dart';

class ProfileSwitcherPage extends StatelessWidget {
  final AccountRepository accountRepository;
  const ProfileSwitcherPage({super.key, required this.accountRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileSwitcherBloc(accountRepository)..add(LoadAccount()),
      child: BlocBuilder<ProfileSwitcherBloc, ProfileSwitcherState>(
        builder: (context, state) {
          if (state is ProfileSwitcherLoading || state is ProfileSwitcherInitial) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
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
                  const Text('Your Profiles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...account.profiles.map((profile) => ListTile(
                    title: Text(profile.name),
                    subtitle: Text(profile.type.name),
                    trailing: profile.id == account.activeProfileId
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      context.read<ProfileSwitcherBloc>().add(SwitchProfile(profile.id));
                      // Optionally navigate after switch
                      // Navigator.pushReplacementNamed(context, '/home');
                    },
                  )),
                  const Divider(),
                  const Text('Add New Profile', style: TextStyle(fontSize: 16)),
                  Wrap(
                    spacing: 12,
                    children: ProfileType.values
                        .where((type) => !account.profiles.any((p) => p.type == type))
                        .map((type) => ElevatedButton(
                      onPressed: () {
                        context.read<ProfileSwitcherBloc>().add(AddProfile(type));
                      },
                      child: Text(type.name[0].toUpperCase() + type.name.substring(1)),
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
    );
  }
}
```
# End of file: lib/profile_switcher/profile_switcher_page.dart

# File: lib/widgets/map_address_selector.dart
```text
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
```
# End of file: lib/widgets/map_address_selector.dart

# File: packages/account_repository/lib/account_repository.dart
```text
export 'src/account_repository.dart';
export 'src/model/models.dart';
export 'package:profile_repository/profile_repository.dart';
```
# End of file: packages/account_repository/lib/account_repository.dart

# File: packages/account_repository/lib/src/account_repository.dart
```text
import 'dart:convert';

import 'package:account_repository/account_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;


abstract class AccountRepository {
  Future<Account> createAccount(Account account);
  Future<Account> getAccount(Account account);
  Future<Account> updateAccount(Account account);
  Future<Account> deleteAccount(Account account);

  Future<Account> fetchAccount();
  Future<void> setActiveProfile(String profileId);
  Future<void> addProfile(ProfileType type, String displayName); //TODO: refactor with Profile profile
}

class AccountRepositoryImpl extends AccountRepository {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final String baseUrl;

  AccountRepositoryImpl({required this.authRepository, required this.profileRepository, required this.baseUrl});

  @override
  Future<Account> createAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> deleteAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> updateAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(account.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<Account> getAccount(Account account) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${account.accountId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json));
    } else {
      throw Exception('Failed to create Account');
    }
  }

  @override
  Future<void> addProfile(ProfileType type, String displayName) {
    // TODO: implement addProfile
    throw UnimplementedError();
  }

  @override
  Future<Account> fetchAccount() {
    // TODO: implement fetchAccount
    throw UnimplementedError();
  }

  @override
  Future<void> setActiveProfile(String profileId) {
    // TODO: implement setActiveProfile
    throw UnimplementedError();
  }

}
```
# End of file: packages/account_repository/lib/src/account_repository.dart

# File: packages/account_repository/lib/src/model/account_model.dart
```text
import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart' show Profile;

class Account extends Equatable {
  final String accountId;
  final String email;
  final List<Profile> profiles;
  final String? activeProfileId;
  final String? status;

  const Account({
    required this.accountId,
    required this.email,
    required this.profiles,
    required this.activeProfileId,
    required this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['account_id'],
      email: json['email'],
      profiles: json['profiles'],
      activeProfileId: json['active_profile_id'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_id': accountId,
      'email': email,
      'profiles': profiles,
      'active_profile_id': activeProfileId,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [accountId, email, profiles, activeProfileId, status,];
}
```
# End of file: packages/account_repository/lib/src/model/account_model.dart

# File: packages/account_repository/lib/src/model/models.dart
```text
export 'account_model.dart';


```
# End of file: packages/account_repository/lib/src/model/models.dart

# File: packages/delivery_repository/lib/delivery_repository.dart
```text
export 'src/delivery_repository.dart';
export 'src/model/models.dart';
export 'package:parcel_repository/parcel_repository.dart';
```
# End of file: packages/delivery_repository/lib/delivery_repository.dart

# File: packages/delivery_repository/lib/src/delivery_repository.dart
```text
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:delivery_repository/src/model/delivery_model.dart';
import 'package:http/http.dart' as http;

abstract class DeliveryRepository {
  Future<Delivery> createDelivery(Delivery delivery);
  Future<Delivery> getDelivery(Delivery delivery);
  Future<Delivery> updateDelivery(Delivery delivery);
  Future<Delivery> deleteDelivery(Delivery delivery);
}

class DeliveryRepositoryImpl extends DeliveryRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  DeliveryRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Delivery> createDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> deleteDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> updateDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(delivery.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

  @override
  Future<Delivery> getDelivery(Delivery delivery) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${delivery.deliveryId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Delivery.fromJson(json));
    } else {
      throw Exception('Failed to create delivery');
    }
  }

}
```
# End of file: packages/delivery_repository/lib/src/delivery_repository.dart

# File: packages/delivery_repository/lib/src/model/delivery_model.dart
```text
import 'package:equatable/equatable.dart';
import 'package:parcel_repository/parcel_repository.dart' show Parcel;

class Delivery extends Equatable {
  final String deliveryId;
  final String token;
  final String qrString;
  final String status;

  final List<Parcel> parcels;

  const Delivery({
    required this.deliveryId,
    required this.token,
    required this.qrString,
    required this.parcels,
    this.status = 'created',
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      deliveryId: json['delivery_id'],
      token: json['token'],
      qrString: json['qr_string'],
      parcels: json['parcels'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_id': deliveryId,
      'token': token,
      'qr_string': qrString,
      'parcels': parcels,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [deliveryId, token, qrString, status, parcels];
}
```
# End of file: packages/delivery_repository/lib/src/model/delivery_model.dart

# File: packages/delivery_repository/lib/src/model/models.dart
```text
export 'delivery_model.dart';


```
# End of file: packages/delivery_repository/lib/src/model/models.dart

# File: packages/parcel_repository/lib/parcel_repository.dart
```text
export 'src/parcel_repository.dart';
export 'src/model/models.dart';
```
# End of file: packages/parcel_repository/lib/parcel_repository.dart

# File: packages/parcel_repository/lib/src/model/models.dart
```text
export 'parcel_model.dart';


```
# End of file: packages/parcel_repository/lib/src/model/models.dart

# File: packages/parcel_repository/lib/src/model/parcel_model.dart
```text
import 'package:equatable/equatable.dart';

class Parcel extends Equatable {
  final String parcelId;
  final String? boxId;
  final String senderEmail;
  final String receiverEmail;
  final String token;
  final String qrString;
  final String status;

  const Parcel({
    required this.parcelId,
    this.boxId,
    required this.senderEmail,
    required this.receiverEmail,
    required this.token,
    required this.qrString,
    this.status = 'created',
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      parcelId: json['parcel_id'],
      boxId: json['box_id']?.toString(),
      senderEmail: json['sender_email'] ?? '',
      receiverEmail: json['receiver_email'] ?? '',
      token: json['token'],
      qrString: json['qr_string'],
      status: json['status'] ?? 'created',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parcel_id': parcelId,
      'box_id': boxId,
      'sender_email': senderEmail,
      'receiver_email': receiverEmail,
      'token': token,
      'qr_string': qrString,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [parcelId, boxId, senderEmail, receiverEmail, token, qrString, status];
}
```
# End of file: packages/parcel_repository/lib/src/model/parcel_model.dart

# File: packages/parcel_repository/lib/src/parcel_repository.dart
```text
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:parcel_repository/parcel_repository.dart' show Parcel;

abstract class ParcelRepository {
  Future<Parcel> createParcel(Parcel parcel);
  Future<Parcel> getParcel(Parcel parcel);
  Future<Parcel> updateParcel(Parcel parcel);
  Future<Parcel> deleteParcel(Parcel parcel);

  Future<List<Parcel>> getParcelList(String userId);
}

class ParcelRepositoryImpl extends ParcelRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  ParcelRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Parcel> createParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> deleteParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> updateParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(parcel.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<Parcel> getParcel(Parcel parcel) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/${parcel.parcelId}/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Parcel.fromJson(json));
    } else {
      throw Exception('Failed to create Parcel');
    }
  }

  @override
  Future<List<Parcel>> getParcelList(String userId) {
    // TODO: implement getParcelList
    throw UnimplementedError();
  }

}
```
# End of file: packages/parcel_repository/lib/src/parcel_repository.dart

# File: packages/profile_repository/lib/profile_repository.dart
```text
export 'src/profile_repository.dart';
export 'src/model/models.dart';
```
# End of file: packages/profile_repository/lib/profile_repository.dart

# File: packages/profile_repository/lib/src/model/models.dart
```text
export 'profile_model.dart';


```
# End of file: packages/profile_repository/lib/src/model/models.dart

# File: packages/profile_repository/lib/src/model/profile_model.dart
```text
import 'package:equatable/equatable.dart';

enum ProfileType { customer, driver, assistant }

class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String avatarUrl;
  final String role;
  final ProfileType type;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatarUrl,
    required this.role,
    required this.type,
  });

  Profile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? avatarUrl,
    String? role,
    ProfileType? type,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      type: type ?? this.type,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      role: json['role'] ?? 'User',
      type: json['type'] ?? 'customer',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'avatar_url': avatarUrl,
      'role': role,
      'type': type,
    };
  }

  @override
  List<Object?> get props => [id, name, email, phone, location, avatarUrl, role, type,];
}
```
# End of file: packages/profile_repository/lib/src/model/profile_model.dart

# File: packages/profile_repository/lib/src/profile_repository.dart
```text
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:profile_repository/profile_repository.dart' show Profile;

abstract class ProfileRepository {
  Future<Profile> createProfile(Profile profile);
  Future<Profile> getProfileById(String profileId);
  Future<Profile> updateProfile(Profile profile);
  Future<Profile> deleteProfile(Profile profile);
}

class ProfileRepositoryImpl extends ProfileRepository {

  final AuthRepository authRepository;
  final String baseUrl;

  ProfileRepositoryImpl({required this.authRepository, required this.baseUrl});

  @override
  Future<Profile> createProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> deleteProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/deliveries'),
      headers: headers,
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

  @override
  Future<Profile> getProfileById(String profileId) async {
    final headers = await authRepository.getAuthHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/deliveries/$profileId/'),
      headers: headers
    );

    if (response.statusCode != 200 || response.statusCode != 201) {
      final data = json.decode(response.body);
      return data.map((json) => Profile.fromJson(json));
    } else {
      throw Exception('Failed to create Profile');
    }
  }

}
```
# End of file: packages/profile_repository/lib/src/profile_repository.dart

# File: test/home/home_page_test.dart
```text
import 'package:bloc_test/bloc_test.dart' show MockBloc;
import 'package:flutter/material.dart' show MaterialApp, CircularProgressIndicator;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:novapost/home/home_page.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';

class MockParcelsBloc extends MockBloc<ParcelsEvent, ParcelsState>
    implements ParcelsBloc {}

void main() {
  late MockParcelsBloc parcelsBloc;

  setUp(() {
    parcelsBloc = MockParcelsBloc();
  });

  testWidgets('displays loading indicator when ParcelsLoading', (tester) async {
    when(() => parcelsBloc.state).thenReturn(ParcelsLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ParcelsBloc>.value(
          value: parcelsBloc,
          child: const HomePageView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
```
# End of file: test/home/home_page_test.dart

# File: test/parcels/bloc/parcels_bloc_test.dart
```text
import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';

class MockDeliveryRepository extends Mock implements ParcelRepository {}

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
    test('initial state is ParcelsInitial', () {
      expect(parcelsBloc.state, equals(ParcelsInitial()));
    });

    //TODO: implement mockParcels
/*    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsLoaded] when LoadParcels succeeds',
      build: () {
        when(() => repository.getParcelList('userId'))
            .thenAnswer((_) async => mockParcels);
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        ParcelsLoaded(parcels: mockParcels, filteredParcels: mockParcels),
      ],
    );*/

    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsError] when LoadParcels fails',
      build: () {
        when(() => repository.getParcelList('userId'))
            .thenThrow(Exception('Failed'));
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        isA<ParcelsError>(),
      ],
    );
  });
}
```
# End of file: test/parcels/bloc/parcels_bloc_test.dart

# File: test/widget_test.dart
```text
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:novapost/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NovaPostApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```
# End of file: test/widget_test.dart

