import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_view_body.dart';

class EditProfileView extends StatelessWidget {
   const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditProfileBody(),
    );
  }
}
