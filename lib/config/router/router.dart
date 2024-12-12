
import 'package:go_router/go_router.dart';
import 'package:the_cats/models/cat.dart';
import 'package:the_cats/views/detail_view.dart';
import 'package:the_cats/views/home_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeView.name,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/detail-cat',
      name: DetailCat.name,
      builder: (context, state) {
        Cat cat = state.extra as Cat;
        return DetailCat(cat: cat);
      }
    )
  ]
);