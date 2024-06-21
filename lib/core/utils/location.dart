import 'dart:async';
import 'dart:convert';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

Timer? _timer;
Location location = Location();

void startSendingLocation() {
  // Cancel any existing timer before starting a new one
  _timer?.cancel();
  _timer = Timer.periodic(const Duration(seconds: 6), (Timer t) {
    updateMyLocation();
  });
}

void stopSendingLocation() {
  if (_timer != null) {
    _timer!.cancel();
    _timer = null;
  }
}

Future<void> checkAndRequestLocationService() async {
  bool serviceEnabled;
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      // Handle case where location service is not enabled
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
    getLocation();
  }
}

void getLocation() async {
  try {
    LocationData? locationData = await location.getLocation();
    sendLocationToAPI(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!
    );
  } catch (e) {
    print("Error getting location: $e");
  }
}


Future<void> sendLocationToAPI({
  required double latitude,
  required double longitude,
}) async {
  const url = 'http://192.168.1.14:3000/api/v1/location/update-location';  // Replace with your API endpoint
  final Uri uri = Uri.parse(url);
  final headers = {
    'Content-Type': 'application/json',
    'token':'${CacheHelper().getData(key: token)}'
  };
  final body = jsonEncode({
    "longitude": longitude,
    "latitude": latitude,
  });

  try {
    final response = await http.put(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
    }
  } catch (e) {
    print('Error sending data: $e');
  }
}
