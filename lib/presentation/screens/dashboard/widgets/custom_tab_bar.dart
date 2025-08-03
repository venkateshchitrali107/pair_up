import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_up/utils/extensions/locale_extension.dart';

import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';
import '../../../themes/app_colors.dart';

enum TabItem { home, match, cup, events, revote }

class CustomTabBar extends StatelessWidget {
  final TabItem selectedTab;
  final Function(TabItem) onTabSelected;

  const CustomTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_50.h,
      margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
      padding: EdgeInsets.all(Sizes.dimen_8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
      ),
      child: Row(
        children: [
          _buildTabItem(
            context,
            TabItem.home,
            AssetsConstants.pickleball,
            context.loc.tabTennis,
          ),
          _buildTabItem(
            context,
            TabItem.match,
            AssetsConstants.match,
            context.loc.tabPairUp,
          ),
          _buildTabItem(
            context,
            TabItem.cup,
            AssetsConstants.cupStar,
            context.loc.tabCup,
          ),
          _buildTabItem(
            context,
            TabItem.events,
            AssetsConstants.documentAdd,
            context.loc.tabEvents,
          ),
          _buildTabItem(
            context,
            TabItem.revote,
            AssetsConstants.revote,
            context.loc.tabRevote,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context,
    TabItem tabItem,
    String iconPath,
    String label,
  ) {
    final isSelected = selectedTab == tabItem;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(tabItem),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryLight : Colors.transparent,
            borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_12.w,
              vertical: Sizes.dimen_8.h,
            ),
            child:
                isSelected
                    ? Center(
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    : Center(
                      child: SvgPicture.asset(
                        iconPath,
                        width: Sizes.dimen_30.sp,
                        height: Sizes.dimen_30.sp,
                        colorFilter: ColorFilter.mode(
                          AppColors.textPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
