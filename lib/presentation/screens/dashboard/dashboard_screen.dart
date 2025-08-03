import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/sport_category.dart';
import '../../../utils/constants/size.dart';
import '../../themes/app_colors.dart';
import 'widgets/dashboard_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedChipIndex = 0;

  void _onCategorySelected(int index) {
    setState(() {
      selectedChipIndex = index;
    });

    // Handle category selection logic here
    final selectedCategory = SportCategory.availableCategories[index];
    debugPrint('Selected category: ${selectedCategory.type}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Sizes.dimen_16.h),
          child: Column(
            children: [
              const DashboardAppHeader(),
              SizedBox(height: Sizes.dimen_32.h),
              CategoryAndSearchSection(
                selectedCategoryIndex: selectedChipIndex,
                onCategorySelected: _onCategorySelected,
              ),
              SizedBox(height: Sizes.dimen_24.h),
            ],
          ),
        ),
      ),
    );
  }
}
