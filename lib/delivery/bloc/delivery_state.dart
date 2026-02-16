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
