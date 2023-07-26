part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  //TODO:
  //ULTIMO GEOLOCATION CONOCOCIDO
  //HISTORIA  DE LAS ULTIMAS UBICACIONES
  const LocationState({this.followingUser = false});

  @override
  List<Object> get props => [followingUser];
}
