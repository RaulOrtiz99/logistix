import 'dart:convert';
import 'package:flutter/material.dart';
import '../location/location_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logistix/blocs/blocs.dart';
import 'package:logistix/theme/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;

  GoogleMapController? _mapController;

  MapBloc({required this.locationBloc}) : super(MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>((event, emit) => emit(state.copyWith(isFollowingUser: false)),);
    on<UpdateUserPolilyneEvent>((event,emit)=>_onPolylineNewPoint);
    
    locationBloc.stream.listen((locationState) {
      if(locationState.lastKnownLocation !=null){
        add(UpdateUserPolilyneEvent(locationState.myLocationHistory));
      }
      if(!state.isFollowingUser)return; 
      if(locationState.lastKnownLocation==null)return; 
      moveCamera(locationState.lastKnownLocation!);
    });
    
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(SnazzyMap));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void _onStartFollowingUser(OnStartFollowingUserEvent event,Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: true));
    if(locationBloc.state.lastKnownLocation==null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onPolylineNewPoint(UpdateUserPolilyneEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
      polylineId: PolylineId('MyRoute'),
      color: Colors.black,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: event.userLocations,
    );
    final currentPolylines= Map<String,Polyline>.from(state.polylines);
    currentPolylines['myroute']= myRoute;
    emit(state.copyWith(polylines: currentPolylines));
  }

}
