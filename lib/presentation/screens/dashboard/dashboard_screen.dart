import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/pro_player.dart';
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

    final selectedCategory = SportCategory.availableCategories[index];
    debugPrint('Selected category: ${selectedCategory.type}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Sizes.dimen_16.h),
          child: Column(
            children: [
              SizedBox(height: Sizes.dimen_8.h),
              const DashboardAppHeader(),
              SizedBox(height: Sizes.dimen_8.h),
              CategoryAndSearchSection(
                selectedCategoryIndex: selectedChipIndex,
                onCategorySelected: _onCategorySelected,
              ),
              SizedBox(height: Sizes.dimen_8.h),

              SubscribedProSection(
                subscribedPlayers: ProPlayer.mockPlayers,
                onSeeAllTap: () {
                  debugPrint('See all subscribed pros tapped');
                },
              ),

              SizedBox(height: Sizes.dimen_8.h),

              FeaturedProSection(
                featuredPlayers: ProPlayer.mockPlayers.take(6).toList(),
                onSeeAllTap: () {
                  debugPrint('See all featured pros tapped');
                },
              ),

              SizedBox(height: Sizes.dimen_16.h),
            ],
          ),
        ),
      ),
    );
  }
}
