import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? positionStream;
  LocationBloc() : super(LocationState()) {
    on<OnNewLocationEvent>((event, emit) {
      emit(state.copyWith(
          lastKnownLocation: event.newLocation,
          myLocationHistory: [...state.myLocationHistory, event.newLocation]));
    });
  }

  Future getCurrentPosition() async {
    //esto es para obtener la posicion actual del usuario
    final position = await Geolocator.getCurrentPosition();
    print('Position: ${position}');
    //todo: retornar un objeto de tipo Latng
    add(OnNewLocationEvent(LatLng(position.latitude, position.longitude)));
  }

  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('position: $position');
      add(OnNewLocationEvent(LatLng(position.latitude, position.longitude)));
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    print('Stop following user');
  }

  @override
  Future<void> close() {
    positionStream?.cancel();
    return super.close();
  }
}
