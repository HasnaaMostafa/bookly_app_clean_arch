import 'package:bookly_app_clean_arch/core/bloc_observer/bloc_observer.dart';
import 'package:bookly_app_clean_arch/core/utils/service_locator.dart';
import 'package:bookly_app_clean_arch/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_clean_arch/features/Home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/app_router.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/constants.dart';

void main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  // await Hive.openBox<BookEntity>(kSimilarBox);
  Bloc.observer = MyBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()))
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (BuildContext context) => NewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()))
              ..fetchNewestBooks()),
        BlocProvider(
            create: (BuildContext context) => SimilarBooksCubit(
                FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()))),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
