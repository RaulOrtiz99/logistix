import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsServiceSubscription;
  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsAndPermissionEvent>(
      (event, emit) => emit(
        state.copyWith(
            isGpsEnabled: event.isGpsEnabled,
            isGpsPermissionGranted: event.isPermissionGranted),
      ),
    );
    _init();
  }

  Future<void> _init() async {
    final isEnabled = await _checkGpsStatus();
    final isGranted = await _isPermissionGranted();
    print('isEnabled: $isEnabled, isGranted: $isGranted');

    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermissionGranted(),
    ]);
    add(GpsAndPermissionEvent(
      isGpsEnabled: gpsInitStatus[0],
      isPermissionGranted: gpsInitStatus[1],
    ));
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      print('service status: $event');
      //todo: disparar eventos...
      final isEnabled = (event.index == 1) ? true : false;
      add(GpsAndPermissionEvent(
        isGpsEnabled: isEnabled,
        isPermissionGranted: state.isGpsPermissionGranted,
      ));
      print('service status: $isEnabled');
    });

    return isEnable;
  }

  Future<void> askGpsAcces() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
          isGpsEnabled: state.isGpsEnabled,
          isPermissionGranted: true,
        ));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        add(GpsAndPermissionEvent(
          isGpsEnabled: state.isGpsEnabled,
          isPermissionGranted: true,
        ));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    // TODO: Limpiar el ServiceStatus Stream
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
