import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_up/utils/constants/assets_constants.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';

class MatchTypeSection extends StatefulWidget {
  const MatchTypeSection({super.key});

  @override
  State<MatchTypeSection> createState() => _MatchTypeSectionState();
}

class _MatchTypeSectionState extends State<MatchTypeSection> {
  int selectedTypeIndex = 0;
  final locationController = TextEditingController(text: 'New Beckton Park');
  final dateController = TextEditingController(text: '20 Jul, Sunday');

  final List<Map<String, dynamic>> matchTypes = [
    {
      'label': 'Friendly',
      'color': AppColors.blue,
      'borderColor': AppColors.blue,
      'textColor': AppColors.white,
    },
    {
      'label': 'Match',
      'color': AppColors.orange.withOpacity(0.1),
      'borderColor': AppColors.orange,
      'textColor': AppColors.orange,
    },
    {
      'label': 'League',
      'color': AppColors.primaryLight,
      'borderColor': AppColors.primary,
      'textColor': AppColors.primary,
    },
  ];

  @override
  void dispose() {
    locationController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.selectMatchType,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_16.sp,
          ),
        ),
        SizedBox(height: Sizes.dimen_12.h),

        Row(
          children: [
            for (var entry in matchTypes.asMap().entries)
              Padding(
                padding: EdgeInsets.only(right: Sizes.dimen_4.w),
                child: _buildCustomChip(
                  label: entry.value['label'],
                  color: entry.value['color'],
                  borderColor: entry.value['borderColor'],
                  textColor: entry.value['textColor'],
                  onTap: () {},
                ),
              ),
          ],
        ),

        SizedBox(height: Sizes.dimen_12.h),

        // Location Field
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cardBorder, width: 0.5),
            borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_12.h,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsConstants.mapPoint,
                  width: Sizes.dimen_30.sp,
                  height: Sizes.dimen_30.sp,
                  colorFilter: ColorFilter.mode(
                    AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: Sizes.dimen_12.w),
                Expanded(
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.loc.enterLocation,
                      hintStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Sizes.dimen_14.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: Sizes.dimen_16.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  AssetsConstants.gps,
                  width: Sizes.dimen_30.sp,
                  height: Sizes.dimen_30.sp,
                  colorFilter: ColorFilter.mode(
                    AppColors.textPrimary.withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: Sizes.dimen_12.h),

        // Date Field
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cardBorder, width: 0.5),
            borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_12.h,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsConstants.calendar,
                  width: Sizes.dimen_30.sp,
                  height: Sizes.dimen_30.sp,
                  colorFilter: ColorFilter.mode(
                    AppColors.textPrimary.withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: Sizes.dimen_12.w),
                Expanded(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.loc.selectDate,
                      hintStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Sizes.dimen_14.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: Sizes.dimen_16.sp,
                      color: AppColors.textPrimary,
                    ),
                    readOnly: true,
                    onTap: () async {
                      // Show date picker
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        final formattedDate =
                            "${date.day} ${_getMonth(date.month)}, ${_getWeekday(date.weekday)}";
                        dateController.text = formattedDate;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomChip({
    required String label,
    required Color color,
    required Color borderColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_12.w,
          vertical: Sizes.dimen_8.h,
        ),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_14.sp,
          ),
        ),
      ),
    );
  }

  String _getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  String _getWeekday(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }
}
