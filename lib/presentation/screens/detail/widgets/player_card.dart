import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/size.dart';
import '../../../themes/app_colors.dart';

class PlayerCard extends StatelessWidget {
  final ProPlayer player1;
  final ProPlayer player2;
  final VoidCallback? onTap;

  const PlayerCard({
    super.key,
    required this.player1,
    required this.player2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.44.sw,
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_8.w,
          vertical: Sizes.dimen_16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.cardBorder, width: 0.5),
          borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: Sizes.dimen_66.sp,
                          height: Sizes.dimen_66.sp,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              player1.profileImageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(
                                      Sizes.dimen_12.r,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: Sizes.dimen_66.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: Sizes.dimen_8.h),
                      ],
                    ),

                    Positioned(
                      left: Sizes.dimen_15.w / 2,
                      right: Sizes.dimen_15.w / 2,
                      bottom: Sizes.dimen_0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_2.w,
                          vertical: Sizes.dimen_4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(Sizes.dimen_12.r),
                        ),
                        child: Text(
                          '${player1.rating} PUR',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.dimen_8.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Sizes.dimen_4.h),

                Text(
                  player1.name.split(' ').first,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.dimen_12.sp,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: Sizes.dimen_2.h),

                Text(
                  _getPlayerLevel(player1),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: Sizes.dimen_10.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: Sizes.dimen_66.w,
                          height: Sizes.dimen_66.w,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              player2.profileImageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(
                                      Sizes.dimen_12.r,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: Sizes.dimen_66.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: Sizes.dimen_8.h),
                      ],
                    ),

                    Positioned(
                      left: Sizes.dimen_15.w / 2,
                      right: Sizes.dimen_15.w / 2,
                      bottom: Sizes.dimen_0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_4.h,
                          vertical: Sizes.dimen_4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(Sizes.dimen_12.r),
                        ),
                        child: Text(
                          '${player2.rating} PUR',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.dimen_8.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Sizes.dimen_4.h),

                Text(
                  player2.name.split(' ').first,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.dimen_12.sp,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: Sizes.dimen_2.h),

                Text(
                  _getPlayerLevel(player2),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: Sizes.dimen_10.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getPlayerLevel(ProPlayer player) {
    if (player.rating >= 4.8) return 'Coach';
    if (player.rating >= 4.5) return 'Advanced';
    if (player.rating >= 4.0) return 'Intermediate';
    return 'Beginner';
  }
}
