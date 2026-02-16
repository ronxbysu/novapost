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