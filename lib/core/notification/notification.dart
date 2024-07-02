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
