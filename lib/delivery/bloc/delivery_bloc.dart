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
