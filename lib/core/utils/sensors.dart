import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

List<double> acc_x = [];
List<double> acc_y = [];
List<double> acc_z = [];
List<double> gyro_x = [];
List<double> gyro_y = [];
List<double> gyro_z = [];
Timer? _timer;
void sensor({
  context
}){
  accelerometerEventStream(samplingPeriod: const Duration(milliseconds: 5)).listen(
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
  gyroscopeEventStream(samplingPeriod: const Duration(milliseconds: 5)).listen(
        (GyroscopeEvent event) {
      gyro_x.add(event.x.abs());
      gyro_y.add(event.y.abs());
      gyro_z.add(event.z.abs());
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
  _timer = Timer.periodic(Duration(seconds: 6), (Timer t) {
    print("acc_x is ${acc_x.length}");
    print("acc_y is ${acc_y.length}");
    print("acc_z is ${acc_z.length}");
    print("gyro_x is ${gyro_x.length}");
    print("gyro_y is ${gyro_y.length}");
    print("gyro_z is ${gyro_z.length}");
    sendDataToAPI();
    // stopSendingData();
  });
}
void stopSendingData() {
  if (_timer != null) {
    _timer!.cancel();
    _timer = null;
  }
}
Future<void> sendDataToAPI() async {
  const url = 'http://192.168.1.9:3000/api/v1/activity';  // Replace with your API endpoint
  final Uri uri = Uri.parse(url);
  final headers = {
    'Content-Type': 'application/json',
    'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjNiNWE1YWQyMjhmNWM4ODcwYmZkOTEiLCJuYW1lIjoiQWhtZWQgM2xhYSIsImVtYWlsIjoiYWhtZWRAZ21haWwuY29tIiwicm9sZSI6InBhdGllbnQiLCJwaG9uZSI6IjAxMTQxMzc1MTg0IiwidmVyaWZpZWQiOmZhbHNlLCJpYXQiOjE3MTU5NjU1ODB9.c0N0xjMuKC2glgvfWk1E3UT6dGM7PiXFOSnTo50lfqE'
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
    } else {
      print('Failed to send data: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Error sending data: $e');
  }
}