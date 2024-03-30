import 'package:delivery_mobile/app/screens/home/home.dart';
import 'package:delivery_mobile/app/screens/product/product.dart';
import 'package:delivery_mobile/app/screens/search/search.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => Home.create(),
  ),
  GoRoute(
    path: '/search',
    builder: (context, state) => const Search(),
  ),
  GoRoute(
    path: '/product',
    builder: (context, state) => Product(id: state.extra as int),
  ),
]);
