import 'package:converse/src/features/home/presentation/screens/home_screen.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:get/get.dart';

List<GetPage> homePages = [
  GetPage(
    name: HomeRoutes.home,
    page: () => const HomeScreen(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
    // middlewares: [
    //   AuthMiddleware(),
    // ],
  ),
];
