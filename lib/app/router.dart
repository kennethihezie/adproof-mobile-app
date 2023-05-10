import 'package:adproof/app/routes.dart';
import 'package:adproof/views/forgot_password/forgot_password.dart';
import 'package:adproof/views/forgot_password/new_password.dart';
import 'package:adproof/views/login/login.dart';
import 'package:adproof/views/signup/otp_screen.dart';
import 'package:adproof/views/signup/privacy_page.dart';
import 'package:adproof/views/signup/signup.dart';
import 'package:adproof/views/signup/signup_with_email.dart';
import 'package:go_router/go_router.dart';

import '../views/forgot_password/password_reset_success.dart';
import '../views/spalsh_screen/splash_screen.dart';

/// Created by collins ihezie on 10/05/23

class AdProofRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: AdProofRoutes.splashScreen,
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: AdProofRoutes.signUp,
        builder: (context, state) => const SignUp()),
    GoRoute(
        path: AdProofRoutes.signUpWithEmail,
        builder: (context, state) => const SignUpWithEmail()),
    GoRoute(
        path: AdProofRoutes.otpPage,
        builder: (context, state) => OtpPage(email: state.extra as String?,)),
    GoRoute(
        path: AdProofRoutes.login,
        builder: (context, state) => const LoginPage()),
    GoRoute(
        path: AdProofRoutes.forgotPassword,
        builder: (context, state) =>  ForgotPassword()),

    GoRoute(
        path: AdProofRoutes.newPassword,
        builder: (context, state) =>  const NewPasswordPage()),

    GoRoute(
        path: AdProofRoutes.passwordSuccessPage,
        builder: (context, state) =>  const PasswordResetSuccess()),

    GoRoute(
        path: AdProofRoutes.privacyPage,
        builder: (context, state) =>  const PrivacyPage()),
  ]);
}
