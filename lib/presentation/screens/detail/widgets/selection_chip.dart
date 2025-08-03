import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../themes/app_colors.dart';

class SelectionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_12.w,
          vertical: Sizes.dimen_8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedButton : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.selectedButton : AppColors.cardBorder,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(Sizes.dimen_30.r),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_14.sp,
          ),
        ),
      ),
    );
  }
}
