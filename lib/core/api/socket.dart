import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/notification/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AppSocket {
  static Map<String, dynamic> options = {
    'transports': ['websocket'],
    'autoConnect': false,
    'query': {
      'userId': CacheHelper().getData(key: userId),
    },
  };
  static String mentor = '';
  static late IO.Socket socket;
  static void appSocket() {
    socket = IO.io('http://${EndPoints.IP}:3000', options);
    socket.connect();
    socket.onConnect((data) {
      print('Connect To Server');
    });
    socket.onDisconnect((data) {
      print('Socket Disconnect');
    });
    if (CacheHelper().getData(key: userRole) == 'patient') {
      socket.on('fallingNotification', (data) {
        mentor = data['mentor'];
        AppNotification alarmNotification = AppNotification();
        alarmNotification.requestNotificationPermissions();
        alarmNotification.init();
        alarmNotification.showNotification(
            title: 'Hallo ${CacheHelper().getData(key: userName)}',
            body: 'Are you Ok ?',
            patient: true,
            isFall: true);
      });
      socket.on('reminder', (data) {
        AppNotification alarmNotification = AppNotification();
        alarmNotification.requestNotificationPermissions();
        alarmNotification.init();
        alarmNotification.showNotification(
            title: 'Hallo ${CacheHelper().getData(key: userName)}',
            body: 'Take your ${data['name']} Medicine',
            patient: false,
            isFall: false);
      });
    }
    if (CacheHelper().getData(key: userRole) == 'mentor') {
      socket.on('mentorWarning', (data) {
        AppNotification alarmNotification = AppNotification();
        alarmNotification.requestNotificationPermissions();
        alarmNotification.init();
        alarmNotification.showNotification(
            title: 'Warning ${CacheHelper().getData(key: userName)}',
            body: data['message'],
            patient: false,
            isFall: true);
      });
    }
  }

  static void sendMessageSocket({
    required String id,
    required String message,
  }) {
    socket.emit('sendMessage', {'to': id, 'message': message});
  }
}
