import 'package:flutter/material.dart';
import 'package:graduation_project/features/treatment/presentation/views/widgets/medicine_view_body.dart';
import 'package:graduation_project/features/treatment/presentation/views/widgets/treatment_view_body.dart';

class TreatmentRegistrationView extends StatelessWidget {
  const TreatmentRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: TreatmentRegistrationViewBody(),
    );
  }
}
