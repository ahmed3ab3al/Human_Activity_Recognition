import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/data/model/update_medicine.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/update_medicine_view_body.dart';

class UpdateMedicineView extends StatelessWidget {
  const UpdateMedicineView({super.key, required this.updateMedicine});
  final UpdateMedicine updateMedicine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateMedicineViewBody(
        updateMedicine: updateMedicine,
      ),
    );
  }
}
