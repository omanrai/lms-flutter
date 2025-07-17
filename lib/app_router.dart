import 'package:go_router/go_router.dart';
import 'package:lms/features/login/presentation/pages/login_page.dart';

class AppRouter {
  static final appRoutes = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "default",
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
