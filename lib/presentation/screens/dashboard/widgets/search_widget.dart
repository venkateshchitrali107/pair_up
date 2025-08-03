import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_8.w,
        vertical: Sizes.dimen_4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.appbarIconBg,
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
        border: Border.all(
          color: AppColors.appbarIconBg,
          width: _isSearchFocused ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsConstants.magnifer,
            height: Sizes.dimen_30.sp,
            width: Sizes.dimen_30.sp,
          ),
          SizedBox(width: Sizes.dimen_4.w),

          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Handle search logic here
              },
              onTap: () {
                setState(() {
                  _isSearchFocused = true;
                });
              },
              onEditingComplete: () {
                setState(() {
                  _isSearchFocused = false;
                });
                FocusScope.of(context).unfocus();
              },
              onSubmitted: (value) {
                setState(() {
                  _isSearchFocused = false;
                });
                FocusScope.of(context).unfocus();
                // Handle search submission
              },
              decoration: InputDecoration(
                hintText: context.loc.search,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // Clear button (only show when there's text)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child:
                _searchController.text.isNotEmpty
                    ? GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(Sizes.dimen_4.w),
                        child: Icon(
                          Icons.clear,
                          size: Sizes.dimen_16.sp,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
