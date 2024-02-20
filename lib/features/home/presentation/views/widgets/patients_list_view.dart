import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/patient_list_item.dart';

import '../../../../../core/utils/app_router.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context, index,
            ) {
          return  SizedBox(
            height: 20.h,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return  InkWell(
            onTap: (){
              GoRouter.of(context).push(
                  AppRouter.kPatientDetails
              );
            }, 
              child: const PatientListItem()
          );
        },
      );
    }

  }

