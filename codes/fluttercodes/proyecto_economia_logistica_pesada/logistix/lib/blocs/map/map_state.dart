part of 'map_bloc.dart';
//todo estes es nuestro estado inicial

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;

//todo polyline 

final Map<String,Polyline>polylines;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    Map<String,Polyline>? polylines,
  }):polylines=polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    Map<String,Polyline>?polylines
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object> get props => [isMapInitialized, isFollowingUser,polylines];
}
