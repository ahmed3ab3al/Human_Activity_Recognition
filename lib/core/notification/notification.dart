import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/socket/socket.dart';

class FallNotification {
  FallNotification._();
  static final FallNotification _instance = FallNotification._();
  factory FallNotification() => _instance;

  static final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  Timer? _noResponseTimer;

  Future<void> init() async {
    await awesomeNotifications.initialize(
      null,  // Default icon for notifications
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
    required bool patient
  }) async {
    await awesomeNotifications.createNotification(
      actionButtons: patient?[
        NotificationActionButton(
            key: 'YES',
            label: 'Yes',
            color: Colors.green
        ),
        NotificationActionButton(
            key: 'NO',
            label: 'No',
            isDangerousOption: true
        )
      ] : [
        NotificationActionButton(
            key: 'Confirm',
            label: 'Confirm',
            color: Colors.green
        ),
      ],
      content: NotificationContent(
        notificationLayout: NotificationLayout.Default,
        largeIcon: 'asset://assets/images/fall.png',
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
      NotificationSocket.socket.emit(
          'fallTimeout',{
        'patientName': CacheHelper().getData(key: userName),
        'mentor':'667850ecfa9b107c1f7bf9f1'
      }
      );
    });
  }

  Future<void> _startListeningNotification() async {
    awesomeNotifications.setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        if (receivedAction.buttonKeyPressed == 'NO') {
          NotificationSocket.socket.emit(
              'fallTimeout',{
            'patientName': CacheHelper().getData(key: userName),
            'mentor':'667850ecfa9b107c1f7bf9f1'
          }
          );
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