import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/views/check_email.dart';
import 'package:graduation_project/features/auth/presentation/views/login_view.dart';
import 'package:graduation_project/features/auth/presentation/views/reset_password_view.dart';
import 'package:graduation_project/features/auth/presentation/views/sign_up_view.dart';
import 'package:graduation_project/features/auth/presentation/views/verify_password_view.dart';
import 'package:graduation_project/features/home/presentation/views/mentor_view.dart';
import 'package:graduation_project/features/home/presentation/views/patient_details_view.dart';
import 'package:graduation_project/features/home/presentation/views/patient_view.dart';
import 'package:graduation_project/features/medicine/presentation/views/add_medicine_view.dart';
import 'package:graduation_project/features/on_boarding/presentation/views/on_barding_view.dart';
import 'package:graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/features/medicine/presentation/views/mentor_medicine_view.dart';
import '../../features/profile/presentation/views/profile_data_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = '/onBoarding';
  static const kSelection = '/selection';
  static const kLogin = '/login';
  static const kVerify = '/verify';
  static const kSignUp = '/signUp';
  static const kReset = '/reset';
  static const kAddMedicine = '/medicine';
  static const kBackTreatment = '/treatment';
  static const kBackHome = '/home';
  static const kEditProfile = '/profile';
  static const kPatientDetails = '/patientDetails';
  static const kCheckEmail = '/checkEmail';
  static const kPatientHome = '/patientHome';
  static const kProfileDataViewBody = '/profileDataViewBody';
  static const kShowProfile = '/ShowProfile';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kVerify,
        builder: (context, state) => const VerificationView(),
      ),
      GoRoute(
        path: kReset,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kAddMedicine,
        builder: (context, state) => const AddMedicineView(),
      ),
      GoRoute(
        path: kBackTreatment,
        builder: (context, state) => const MentorMedicineView(),
      ),
      GoRoute(
        path: kBackHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kEditProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kPatientDetails,
        builder: (context, state) => const PatientDetailsView(),
      ),
      GoRoute(
        path: kPatientHome,
        builder: (context, state) => const PatientView(),
      ),
      GoRoute(
        path: kCheckEmail,
        builder: (context, state) => CheckEmail(),
      ),
      GoRoute(
        path: kShowProfile,
        builder: (context, state) => const ProfileDataView(),
      ),
    ],
  );
}
