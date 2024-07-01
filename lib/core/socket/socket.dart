import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/notification/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class NotificationSocket{
  static Map<String,dynamic> options ={
    'transports':['websocket'],
    'autoConnect':false,
    'query': {
      'userId': CacheHelper().getData(key: userId),
    },
  };
  String mentor = '';
  static late IO.Socket socket;
  static void fallSocket(){
    socket = IO.io(
      'http://192.168.1.14:3000',
      options
    );
    socket.connect();
    socket.onConnect((data) {
      print('Connect To Server');
    });
    socket.onDisconnect((data) {
      print('Socket Disconnect');
    });
    if (CacheHelper().getData(key: userRole) == 'patient') {
      socket.on('fallingNotification', (data){
      FallNotification alarmNotification = FallNotification();
      alarmNotification.requestNotificationPermissions();
      alarmNotification.init();
      alarmNotification.showNotification(
          title: 'Hallo ${CacheHelper().getData(key: userName)}',
          body: 'Are you Ok ?',
        patient: true,
      );

    }
    );
    }
    if (CacheHelper().getData(key: userRole) == 'mentor') {
      socket.on('mentorWarning', (data){
        FallNotification alarmNotification = FallNotification();
        alarmNotification.requestNotificationPermissions();
        alarmNotification.init();
        alarmNotification.showNotification(
            title: 'Warning ${CacheHelper().getData(key: userName)}',
            body: 'Your Patient is Fall',
          patient: false
        );
        print(data);
    });
    }
  }
}