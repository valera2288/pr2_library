import 'package:go_router/go_router.dart';

import '../screens/not_found_screen.dart';

import '../screens/books/book_list_screen.dart';
import '../screens/books/book_detail_screen.dart';
import '../screens/authors/author_list_screen.dart';
import '../screens/authors/author_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/books',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/books',
    ),
    GoRoute(
      path: '/books',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: BookListScreen(),
      ),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => BookDetailScreen(
            id: int.tryParse(state.pathParameters['id']!) ?? -1,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/authors',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AuthorListScreen(),
      ),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => AuthorDetailScreen(
            id: int.tryParse(state.pathParameters['id']!) ?? -1,
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (c, s) => NotFoundScreen(location: s.uri.toString()),
);
