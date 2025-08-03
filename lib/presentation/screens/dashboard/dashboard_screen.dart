import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';
import 'package:pair_up/utils/extensions/locale_extension.dart';

import '../../../utils/constants/assets_constants.dart';
import '../../../utils/constants/size.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Sizes.dimen_16.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.loc.selectAPro,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: Sizes.dimen_8.h),
                        Text(
                          context.loc.chooseYourDesiredPro,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textPrimary.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const BellIconWidget(),
                  SizedBox(width: Sizes.dimen_8.h),
                  const ProfileIconWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BellIconWidget extends StatelessWidget {
  const BellIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_66.sp,
      height: Sizes.dimen_66.sp,
      decoration: BoxDecoration(
        color: AppColors.appbarIconBg,
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          AssetsConstants.bellBing,
          width: Sizes.dimen_24.sp,
          height: Sizes.dimen_24.sp,
          errorBuilder: (context, error, stackTrace) {
            // Fallback if bell icon doesn't load
            return Icon(
              Icons.notifications,
              size: Sizes.dimen_24.sp,
              color: Color(0xFF111E26),
            );
          },
        ),
      ),
    );
  }
}

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_66.sp,
      height: Sizes.dimen_66.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
        child: Image.asset(
          AssetsConstants.profileImage,
          width: Sizes.dimen_66.sp,
          height: Sizes.dimen_66.sp,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: Sizes.dimen_66.sp,
              height: Sizes.dimen_66.sp,
              decoration: BoxDecoration(
                color: AppColors.appbarIconBg,
                borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
              ),
              child: Icon(
                Icons.person,
                size: Sizes.dimen_24.sp,
                color: AppColors.textPrimary,
              ),
            );
          },
        ),
      ),
    );
  }
}
