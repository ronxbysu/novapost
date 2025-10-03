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
