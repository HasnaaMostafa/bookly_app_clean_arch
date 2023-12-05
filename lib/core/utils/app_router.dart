import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:go_router/go_router.dart';

import '../../features/Home/presentation/views/book_details_view.dart';
import '../../features/Home/presentation/views/home_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(
          path: "/searchView", builder: (context, state) => const SearchView()),
      GoRoute(path: "/homeView", builder: (context, state) => const HomeView()),
      GoRoute(
          path: "/bookDetailsView",
          builder: (context, state) => BookDetailsView(
                bookEntity: state.extra as BookEntity,
              )),
    ],
  );
}
