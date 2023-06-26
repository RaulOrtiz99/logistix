part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

//TODO: aca se colocan los eventos 

class GpsAndPermissionEvent extends GpsEvent{
  final bool isGpsEnabled; 
  final bool isPermissionGranted; 

  const GpsAndPermissionEvent({required this.isGpsEnabled, required this.isPermissionGranted});


}
