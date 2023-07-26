import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? positionStream;
  LocationBloc() : super(LocationState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future getCurrentPosition() async {
    //esto es para obtener la posicion actual del usuario
    final position = await Geolocator.getCurrentPosition();
    print('Position: ${position}');
    //todo: retornar un objeto de tipo Latng
  }

  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('position: $position');
    });
  }

  void stopFollowingUser(){
    positionStream?.cancel();
    print('Stop following user');
  }
  
  @override
  Future<void> close() {
    positionStream?.cancel();
    return super.close();
  }
}
