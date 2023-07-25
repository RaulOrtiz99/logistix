import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
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
    print(isEnabled);

    add(GpsAndPermissionEvent(
      isGpsEnabled: isEnabled,
      isPermissionGranted: state.isGpsPermissionGranted,
    ));
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
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

  @override
  Future<void> close() {
    // TODO: Limpiar el ServiceStatus Stream
    return super.close();
  }
}
