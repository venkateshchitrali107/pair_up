import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection.dart';
import 'presentation/routes/routes.dart';
import 'presentation/themes/cubit/theme_cubit.dart';
import 'utils/constants/app_constants.dart';

class PairUpApp extends StatelessWidget {
  const PairUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: locator<ThemeCubit>(),
      builder: (context, state) {
        return MaterialApp.router(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          routerDelegate: Routes.router.routerDelegate,
          routeInformationProvider: Routes.router.routeInformationProvider,
          routeInformationParser: Routes.router.routeInformationParser,
        );
      },
    );
  }
}
