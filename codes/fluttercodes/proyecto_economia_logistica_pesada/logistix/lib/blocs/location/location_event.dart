part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}
//esta clase  es para un evento que se dispara cuando se crea una nueva ubicacion
class OnNewLocationEvent extends LocationEvent{
  final LatLng newLocation; 
  const OnNewLocationEvent(this.newLocation);
}

class OnStartFollowingUser extends LocationEvent{}

class OnStopFollowingUser extends LocationEvent {}