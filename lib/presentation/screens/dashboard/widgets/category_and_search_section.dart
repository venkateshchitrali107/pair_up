import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import 'search_widget.dart';
import 'sports_category_list.dart';

class CategoryAndSearchSection extends StatelessWidget {
  final int selectedCategoryIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryAndSearchSection({
    super.key,
    required this.selectedCategoryIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 0.55.sw,
          child: SportsCategoryList(
            selectedIndex: selectedCategoryIndex,
            onCategorySelected: onCategorySelected,
          ),
        ),
        SizedBox(width: Sizes.dimen_16.w),
        const Expanded(child: SearchWidget()),
      ],
    );
  }
}
