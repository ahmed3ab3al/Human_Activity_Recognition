import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/features/map/presentation/view_models/map_cubit.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..updateMyLocation(),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {

          return GoogleMap(
            polygons: MapCubit.get(context).myPolygons,
            initialCameraPosition: const CameraPosition(
                target: LatLng(
                    37.43296265331129,
                    -122.08832357078792
                ),
                zoom: 11.0),
            onMapCreated: (GoogleMapController controller) {
              MapCubit.get(context).mapController = controller;
            },
            markers: MapCubit.get(context).markers,

          );
        },
      ),
    );
  }
}
