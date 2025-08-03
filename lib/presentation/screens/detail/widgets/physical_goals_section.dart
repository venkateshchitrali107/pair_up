import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';

class PhysicalGoalsSection extends StatelessWidget {
  const PhysicalGoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.physicalGoals,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_16.sp,
          ),
        ),
        SizedBox(height: Sizes.dimen_8.h),

        Text(
          context.loc.physicalGoalsSubtitle,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: Sizes.dimen_14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: Sizes.dimen_12.h),

        _buildInfoCard(context, context.loc.playerLevelInfo),

        SizedBox(height: Sizes.dimen_12.h),

        _buildInfoCard(context, context.loc.playerLevelInfo),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Sizes.dimen_16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
        borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Sizes.dimen_14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
