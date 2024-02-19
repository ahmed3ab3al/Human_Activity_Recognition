import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/verify_password_view_body.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});
  @override
  State<VerificationView> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationView> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationViewBody()
    );
  }
}
