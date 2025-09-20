import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../Presentation/AddHostler/AddHostlerDetails.dart';
import '../Presentation/AddHostler/AddHostlerPic.dart';
import '../Presentation/AddHostler/AddMobileNumber.dart';
import '../Presentation/Authentication/ForgotPassword.dart';
import '../Presentation/Authentication/LogIn.dart';
import '../Presentation/DashBoard.dart';
import '../Presentation/splash.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Dashboard(), state);
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
