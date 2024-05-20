import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationState();
}

class _LocationState extends State<LocationPage> {
  var markers = HashSet<Marker>();
  late Location location;

  @override
  void initState() {
    initPolygons();
    location = Location();
    updateMyLocation();
    super.initState();
  }


  Set<Polygon> myPolygons = {};
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(

      polygons: myPolygons,
      initialCameraPosition: const CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792), zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        setState(() {
          markers.add(
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(37.43296265331129, -122.08832357078792),
                infoWindow: InfoWindow(title: 'My Location',),

              ));
        });
        location.onLocationChanged.listen((locationData) {

        });
      },
      markers: markers,

    );
  }

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
location.onLocationChanged.listen((locationData) {
  var cameraPosition = CameraPosition(
    target: LatLng(locationData.latitude!, locationData.longitude!,),

zoom: 13.0,
  );
  mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

});
  }

  void updateMyLocation() async {
   await checkAndRequestLocationService();
 var hasPermission = await  checkAndRequestPermission();
 if(hasPermission){
   getLocation();
 }


  }
}
