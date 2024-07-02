import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/api/dio_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:location/location.dart';

import '../../../../constants.dart';
import '../../../../core/errors/exception.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.dioHelper) : super(MapInitial());

  final DioHelper dioHelper;
  static MapCubit get(context) => BlocProvider.of(context);

  var markers = HashSet<Marker>();
  Location location = Location();

  Set<Polygon> myPolygons = {};
  GoogleMapController? mapController;

  void initPolygons() {
    Polygon polygon = const Polygon(points: [
      LatLng(37.43296265331129, -122.08832357078792),
      LatLng(37.430939, -122.084057),
      LatLng(37.43296265331129, -122.08832357078792),
    ], polygonId: PolygonId('1'));
    myPolygons.add(polygon);
  }

  Future<void> checkAndRequestLocationService() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {}
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
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void updateMyLocation() async {
    await checkAndRequestLocationService();
    var hasPermission = await checkAndRequestPermission();
    if (hasPermission) {
      getPatientLocation();
    }
  }

  void getPatientLocation() async {
    emit(GetLocationLoading());
    try {
      dynamic response =
          await dioHelper.get('${EndPoints.getLocation}$patientID');
      // Parse the response to extract longitude and latitude
      var data = response['location'];
      double longitude = data['longitude'];
      double latitude = data['latitude'];
      var cameraPosition = CameraPosition(
        target: LatLng(
          latitude,
          longitude,
        ),
        zoom: 13.0,
      );
      mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      markers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(
          title: 'My Location',
        ),
      ));
      emit(GetLocationSuccess());
    } on ServerException catch (e) {
      emit(GetLocationError(error: e.errorModel.message));
    }
  }
}
