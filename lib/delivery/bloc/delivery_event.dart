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
