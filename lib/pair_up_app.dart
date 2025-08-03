import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'di/injection.dart';
import 'presentation/routes/routes.dart';
import 'presentation/themes/cubit/theme_cubit.dart';
import 'utils/constants/app_constants.dart';
import 'utils/constants/size.dart';

class PairUpApp extends StatelessWidget {
  const PairUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final screenWidth = MediaQuery.of(context).size.width;
        double designWidth =
            (kIsWeb && screenWidth >= 800) ? Sizes.dimen_1920 : Sizes.dimen_375;
        double designHeight =
            (kIsWeb && screenWidth >= 800) ? Sizes.dimen_1080 : Sizes.dimen_667;
        return ScreenUtilInit(
          designSize:
              orientation == Orientation.portrait
                  ? Size(designWidth, designHeight)
                  : Size(designHeight, designWidth),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              bloc: locator<ThemeCubit>(),
              builder: (context, state) {
                return MaterialApp.router(
                  title: AppConstants.appName,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''), // English
                    Locale('es', ''), // Spanish
                  ],
                  theme:
                      state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
                  routerDelegate: Routes.router.routerDelegate,
                  routeInformationProvider:
                      Routes.router.routeInformationProvider,
                  routeInformationParser: Routes.router.routeInformationParser,
                );
              },
            );
          },
        );
      },
    );
  }
}
