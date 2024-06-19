import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static MapCubit get(context) => BlocProvider.of(context);

  var markers = HashSet<Marker>();
  Location location = Location();

  Set<Polygon> myPolygons = {};
  GoogleMapController? mapController;

  void initPolygons() {
    Polygon polygon = const Polygon(
        points: [
          LatLng(37.43296265331129, -122.08832357078792),
          LatLng(37.430939, -122.084057),
          LatLng(37.43296265331129, -122.08832357078792),
        ],
        polygonId: PolygonId('1'));
    myPolygons.add(polygon);
  }

  Future<void> checkAndRequestLocationService() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled)
      {
      }
    }
  }

  Future<bool> checkAndRequestPermission() async {
    PermissionStatus permissionGranted;
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted)
      {
        return false;
      }
    }
    return true;
  }

  void getLocation() async {
    emit(GetLocationLoading());
    location.onLocationChanged.listen((locationData) {
      var cameraPosition = CameraPosition(
        target: LatLng(
          locationData.latitude!,
          locationData.longitude!,
        ),
        zoom: 13.0,
      );
      mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        markers.add(Marker(
              markerId: const MarkerId('1'),
              position: LatLng(locationData.latitude!, locationData.longitude!),
              infoWindow: const InfoWindow(title: 'My Location',),

            ));
      emit(GetLocationSuccess());
    }
    );
  }

  void updateMyLocation() async {
    await checkAndRequestLocationService();
    var hasPermission = await  checkAndRequestPermission();
    if(hasPermission){
      getLocation();
    }
  }

}
