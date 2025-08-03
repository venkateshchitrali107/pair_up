import '../../utils/constants/assets_constants.dart';

enum SportType { tennis, badminton, tableTennis, viewRecording }

class SportCategory {
  final SportType type;
  final String iconPath;
  final String localizationKey;

  const SportCategory({
    required this.type,
    required this.iconPath,
    required this.localizationKey,
  });

  static const List<SportCategory> availableCategories = [
    SportCategory(
      type: SportType.tennis,
      iconPath: AssetsConstants.pickleball,
      localizationKey: 'tennis',
    ),
    SportCategory(
      type: SportType.badminton,
      iconPath: AssetsConstants.pickleball,
      localizationKey: 'badminton',
    ),
    SportCategory(
      type: SportType.tableTennis,
      iconPath: AssetsConstants.pickleball,
      localizationKey: 'tableTennis',
    ),
    SportCategory(
      type: SportType.viewRecording,
      iconPath: AssetsConstants.cameraSquare,
      localizationKey: 'viewRecording',
    ),
  ];

  static SportCategory getCategoryByType(SportType type) {
    return availableCategories.firstWhere((category) => category.type == type);
  }
}
