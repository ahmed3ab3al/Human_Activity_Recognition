import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/custom_icon.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';
import '../../view_models/profile_cubit.dart';
import '../../view_models/profile_states.dart';

class ProfileDataViewBody extends StatelessWidget {
  const ProfileDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return state is GetUserProfileLoadingState ? const Center(child: CircularProgressIndicator()) :  const Column(
          children: [
            Row(
              children: [
                CustomIcon(icon: Icons.person),
                Text('ID'),
                Spacer(),
              ],
            ),
            LineContainer(),
            Row(
              children: [
                CustomIcon(icon: Icons.phone),
                Text('Number'),
                Spacer(),
                Text('123456'),
              ],
            ),
            LineContainer(),
            Row(
              children: [
                CustomIcon(icon: Icons.logout_outlined),
                Text('Logout'),
              ],
            ),
          ],
        );
      },
    );
  }
}
