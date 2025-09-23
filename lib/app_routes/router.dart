import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/Presentation/Authentication/LogIn.dart';
import 'package:ozritpgpaytrack/Presentation/HsotlersList.dart';
import 'package:ozritpgpaytrack/Presentation/SelectHostel.dart';
import 'package:ozritpgpaytrack/Presentation/splash.dart';
import '../Presentation/AddHostler/AadharVerification.dart';
import '../Presentation/AddHostler/AddHostlerDetails.dart';
import '../Presentation/AddHostler/AddHostlerPic.dart';
import '../Presentation/AddHostler/AddMobileNumber.dart';
import '../Presentation/AddHostler/EmergencyDetails.dart';
import '../Presentation/AddHostler/HostlerVerifyOtp.dart';
import '../Presentation/AddHostler/RoomDetails.dart';
import '../Presentation/Authentication/ForgotPassword.dart';

import '../Presentation/DashBoard.dart';
import '../Presentation/HostlerDetails.dart';
import '../Presentation/PaymentHistory.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(SplashScreen(), state);
      },
    ),
    GoRoute(
      path: '/forgot_password',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(ForgotPassword(), state);
      },
    ),
    GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Dashboard(), state);
      },
    ),
    GoRoute(
      path: '/new_hostler_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(NewHostlerDetails(), state);
      },
    ),
    GoRoute(
      path: '/add_hostler_pic',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(AddHostlerPic(), state);
      },
    ),
    GoRoute(
      path: '/add_mobile_number',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(AddMobileNumber(), state);
      },
    ),
    GoRoute(
      path: '/hostler_verify_otp',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(HostlerVerifyOtp(), state);
      },
    ),
    GoRoute(
      path: '/aadhar_verification',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(AadharVerification(), state);
      },
    ),
    GoRoute(
      path: '/emergency_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(EmergencyDetails(), state);
      },
    ),
    GoRoute(
      path: '/room_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(RoomDetails(), state);
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(LogIn(), state);
      },
    ),
    GoRoute(
      path: '/hostler_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(HostlerDetails(), state);
      },
    ),
    GoRoute(
      path: '/select_hostel',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(SelectHostel(), state);
      },
    ),
    GoRoute(
      path: '/hostelers_list',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(HostelersList(), state);
      },
    ),
    GoRoute(
      path: '/payment_history',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(PaymentHistory(), state);
      },
    ),
  ],
);

Page<dynamic> buildSlideTransitionPage(Widget child, GoRouterState state) {
  // if (Platform.isIOS) {
  //   // Use default Cupertino transition on iOS
  //   return CupertinoPage(key: state.pageKey, child: child);
  // }

  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
