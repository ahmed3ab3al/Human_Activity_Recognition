import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

List<dynamic> acc_x = [];
List<dynamic> acc_y = [];
List<dynamic> acc_z = [];
List<dynamic> gyro_x = [];
List<dynamic> gyro_y = [];
List<dynamic> gyro_z = [];

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