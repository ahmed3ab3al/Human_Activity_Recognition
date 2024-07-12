import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../api/end_points.dart';

List<double> acc_x = [];
List<double> acc_y = [];
List<double> acc_z = [];
List<double> gyro_x = [];
List<double> gyro_y = [];
List<double> gyro_z = [];
Timer? _timer;
void sensor({context}) {
  accelerometerEventStream(samplingPeriod: SensorInterval.fastestInterval)
      .listen(
    (AccelerometerEvent event) {
      acc_x.add(event.x);
      acc_y.add(event.y);
      acc_z.add(event.z);
    },
    onError: (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Sensor Not Found"),
              content: Text(
                  "It seems that your device doesn't support Accelerometer Sensor"),
            );
          });
    },
    cancelOnError: true,
  );
  gyroscopeEventStream(samplingPeriod: SensorInterval.fastestInterval).listen(
    (GyroscopeEvent event) {
      gyro_x.add(event.x);
      gyro_y.add(event.y);
      gyro_z.add(event.z);
    },
    onError: (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Sensor Not Found"),
              content: Text(
                  "It seems that your device doesn't support Gyroscope Sensor"),
            );
          });
    },
    cancelOnError: true,
  );
}

void startSendingData() {
  // Cancel any existing timer before starting a new one
  // 6 fantastaic  low but not make mistake
  // 3 middle
  // 2 good    fast but make mistake
  _timer?.cancel();
  _timer = Timer.periodic(const Duration(seconds: 6), (Timer t) {
    sendDataToAPI();
  });
}

void stopSendingData() {
  if (_timer != null) {
    _timer!.cancel();
    _timer = null;
  }
}

Future<void> sendDataToAPI() async {
  const url =
      'http://${EndPoints.IP}:3000/api/v1/activity'; // Replace with your API endpoint
  final Uri uri = Uri.parse(url);
  final headers = {
    'Content-Type': 'application/json',
    'token': '${CacheHelper().getData(key: token)}'
  };
  final body = jsonEncode({
    "acc_x": acc_x,
    "acc_y": acc_y,
    "acc_z": acc_z,
    "gyro_x": gyro_x,
    "gyro_y": gyro_y,
    "gyro_z": gyro_z
  });

  try {
    final response = await http.patch(uri, headers: headers, body: body);
    acc_x.clear();
    acc_y.clear();
    acc_z.clear();
    gyro_x.clear();
    gyro_y.clear();
    gyro_z.clear();

    if (response.statusCode == 200) {
      print('Data sent successfully');
    }
  } catch (e) {
    print('Error sending data: $e');
    acc_x.clear();
    acc_y.clear();
    acc_z.clear();
    gyro_x.clear();
    gyro_y.clear();
    gyro_z.clear();
  }
}
