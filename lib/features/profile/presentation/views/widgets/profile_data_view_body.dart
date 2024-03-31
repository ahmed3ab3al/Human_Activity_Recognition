// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/widgets/custom_icon.dart';
// import 'package:graduation_project/features/auth/manager/cubit.dart';
// import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';
//
// import '../../../../auth/manager/states.dart';
//
// class ProfileDataViewBody extends StatelessWidget {
//   const ProfileDataViewBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppAuthCubit, AuthStates>(
//       listener: (context, state) {
//         if(state is GetUserErrorState){
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.error),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         return state is GetUserLoadingState ? const Center(child: CircularProgressIndicator()) :  Column(
//           children: [
//             Row(
//               children: [
//                 CustomIcon(icon: Icons.person),
//                 Text('ID'),
//                 Spacer(),
//                 Text()
//               ],
//             ),
//             LineContainer(),
//             Row(
//               children: [
//                 CustomIcon(icon: Icons.phone),
//                 Text('Number'),
//                 Spacer(),
//                 Text('123456'),
//               ],
//             ),
//             LineContainer(),
//             Row(
//               children: [
//                 CustomIcon(icon: Icons.logout_outlined),
//                 Text('Logout'),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
