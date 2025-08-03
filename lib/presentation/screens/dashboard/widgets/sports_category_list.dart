import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/sport_category.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import 'sports_category_chip.dart';

class SportsCategoryList extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const SportsCategoryList({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(SportCategory.availableCategories.length, (
          index,
        ) {
          final category = SportCategory.availableCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              right:
                  index < SportCategory.availableCategories.length - 1
                      ? Sizes.dimen_4.w
                      : 0,
            ),
            child: SportsCategoryChip(
              label: _getLocalizedLabel(context, category.localizationKey),
              icon: category.iconPath,
              isSelected: selectedIndex == index,
              onTap: () => onCategorySelected(index),
            ),
          );
        }),
      ),
    );
  }

  String _getLocalizedLabel(BuildContext context, String key) {
    switch (key) {
      case 'tennis':
        return context.loc.tennis;
      case 'badminton':
        return context.loc.badminton;
      case 'tableTennis':
        return context.loc.tableTennis;
      case 'viewRecording':
        return context.loc.viewRecording;
      default:
        return '';
    }
  }
}
