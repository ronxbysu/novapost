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