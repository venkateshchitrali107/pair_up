import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';

class MentalGoalsSection extends StatelessWidget {
  const MentalGoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.mentalGoals,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_16.sp,
          ),
        ),
        SizedBox(height: Sizes.dimen_8.h),

        Text(
          context.loc.mentalGoalsSubtitle,
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

        SizedBox(height: Sizes.dimen_24.h),

        // Add a Goal Button
        _buildButton(
          context: context,
          label: context.loc.addAGoal,
          backgroundColor: AppColors.selectedButton,
          textColor: AppColors.white,
          onTap: () {
            debugPrint('Add a goal button tapped');
            // TODO: Implement goal adding functionality
          },
        ),

        SizedBox(height: Sizes.dimen_16.h),

        // Save Button
        _buildButton(
          context: context,
          label: context.loc.save,
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
          onTap: () {
            debugPrint('Save button tapped');
            // TODO: Implement save functionality
          },
        ),
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

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.dimen_16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
