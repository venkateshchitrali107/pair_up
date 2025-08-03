import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pair_up/utils/constants/assets_constants.dart';
import 'package:pair_up/utils/constants/size.dart';
import 'package:pair_up/utils/extensions/locale_extension.dart';
import 'presentation/routes/routes.dart';
import 'presentation/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to next screen after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(Routes.dashboardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Sizes.dimen_120.sp,
                      height: Sizes.dimen_120.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            blurRadius: Sizes.dimen_20.sp,
                            offset: Offset(0, 10.w),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                        child: Image.asset(
                          AssetsConstants.appLogo,
                          width: Sizes.dimen_120.sp,
                          height: Sizes.dimen_120.sp,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: Sizes.dimen_120.sp,
                              height: Sizes.dimen_120.sp,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                  Sizes.dimen_20.r,
                                ),
                              ),
                              child: Icon(
                                Icons.people_alt_rounded,
                                size: Sizes.dimen_60.sp,
                                color: AppColors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: Sizes.dimen_24.h),

                    // App Name
                    Text(
                      context.loc.appTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),

                    SizedBox(height: Sizes.dimen_8.h),

                    // Tagline
                    Text(
                      context.loc.appTagline,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),

            // Version at bottom
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_40.h),
              child: Text(
                context.loc.version('1.0.0'),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
