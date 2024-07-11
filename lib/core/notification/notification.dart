import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/socket/socket.dart';

class AppNotification {
  AppNotification._();
  static final AppNotification _instance = AppNotification._();
  factory AppNotification() => _instance;

  static final AwesomeNotifications awesomeNotifications =
      AwesomeNotifications();
  Timer? _noResponseTimer;

  Future<void> init() async {
    await awesomeNotifications.initialize(
      null, // Default icon for notifications
      [
        NotificationChannel(
          channelKey: 'Fall Channel',
          channelName: 'Fall notifications',
          channelDescription: 'Notification channel for Fall',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
        NotificationChannel(
          channelKey: 'alarm_channel',
          channelName: 'Alarm Notifications',
          channelDescription: 'Channel for alarm notifications',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          soundSource: 'resource://raw/res_custom_alarm_sound', // Custom sound resource name
          enableVibration: true,
          playSound: true,
        )
      ],
      debug: true,
    );
    await _startListeningNotification(); // Ensure listeners are set up
  }

  void requestNotificationPermissions() {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> displayAlarm()async {
    await awesomeNotifications.createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'alarm_channel',
        title: 'Alarm',
        body: 'Please Help ${CacheHelper().getData(key: userName)}',
        displayOnForeground: true,
        displayOnBackground: true,
      ),
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    required bool patient,
    required bool isFall,
  }) async {
    await awesomeNotifications.createNotification(
      actionButtons: patient
          ? [
              NotificationActionButton(
                  key: 'YES', label: 'Yes', color: Colors.green),
              NotificationActionButton(
                  key: 'NO', label: 'No', isDangerousOption: true)
            ]
          : [
              NotificationActionButton(
                  key: 'Confirm', label: 'Confirm', color: Colors.green),
            ],
      content: NotificationContent(
        notificationLayout: NotificationLayout.Default,
        largeIcon: isFall
            ? 'asset://assets/images/fall.png'
            : 'asset://assets/images/injection.png',
        id: -1,
        channelKey: 'Fall Channel',
        actionType: ActionType.Default,
        title: title,
        body: body,
        payload: {'notificationId': '123456789'},
      ),
    );

    // Schedule a "No Response" message after a delay
    _noResponseTimer = Timer(const Duration(seconds: 5), () {
      displayAlarm();
      AppSocket.socket.emit('fallTimeout', {
        'patientName': CacheHelper().getData(key: userName),
        'mentor': AppSocket.mentor,
      });
    });
  }

  Future<void> _startListeningNotification() async {
    awesomeNotifications.setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        if (receivedAction.buttonKeyPressed == 'NO') {
          displayAlarm();
          AppSocket.socket.emit('fallTimeout', {
            'patientName': CacheHelper().getData(key: userName),
            'mentor': AppSocket.mentor,
          });
        }
        // Cancel the "No Response" message
        if (_noResponseTimer != null) {
          _noResponseTimer!.cancel();
          _noResponseTimer = null;
        }
        return Future.value(); // Return a non-null Future
      },
    );
  }
}
