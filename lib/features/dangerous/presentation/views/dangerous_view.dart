import 'package:flutter/material.dart';
import 'package:graduation_project/features/dangerous/presentation/views/widgets/dangerous_view_body.dart';

class DangerousView extends StatelessWidget {
  const DangerousView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DangerousActivityViewBody(),
    );
  }
}
