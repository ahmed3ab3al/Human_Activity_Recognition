import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/assets.dart';

String role = 'rolename';
String token = 'token';
String email = '';
String userId = 'id';
String userName = 'name';
String userPhone = 'phone';
String userEmail = 'email';
String userRole = 'role';
String userVerified = 'verified';

String patientID = "";
String mentorID = "";

Map<String, String> activityPhoto = {
  'Fall': AppAssets.fall,
  'Up Stairs': AppAssets.up,
  'Jumping': AppAssets.jump,
  'Standing': AppAssets.standing,
  'Walking': AppAssets.walk,
  'Down Stairs': AppAssets.down,
  'Joging': AppAssets.jogging,
  'Sitting': AppAssets.sit,
  'null': AppAssets.sit,
};

String personImage = CacheHelper().getData(key: userRole) == 'mentor' ? AppAssets.person : AppAssets.oldPerson;
String anotherImage = CacheHelper().getData(key: userRole) == 'mentor' ? AppAssets.oldPerson : AppAssets.person;
