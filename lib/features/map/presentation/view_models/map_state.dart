part of 'map_cubit.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class GetLocationLoading extends MapState {}

class GetLocationSuccess extends MapState {}

class GetLocationError extends MapState {
  GetLocationError({required this.error});
  final error;
}
