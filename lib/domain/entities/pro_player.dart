import '../../utils/constants/assets_constants.dart';

class ProPlayer {
  final String id;
  final String name;
  final String profileImageUrl;
  final String specialty;
  final int atpRanking;
  final bool isSubscribed;
  final int videosLeft;

  const ProPlayer({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.specialty,
    required this.atpRanking,
    required this.isSubscribed,
    this.videosLeft = 0,
  });

  static const List<ProPlayer> mockPlayers = [
    ProPlayer(
      id: '1',
      name: 'Liam Carter',
      profileImageUrl: AssetsConstants.image3,
      specialty: 'Forehand Specialist',
      atpRanking: 850,
      isSubscribed: true,
      videosLeft: 3,
    ),
    ProPlayer(
      id: '2',
      name: 'Emma Wilson',
      profileImageUrl: AssetsConstants.image2,
      specialty: 'Serve & Volley Expert',
      atpRanking: 245,
      isSubscribed: false,
    ),
    ProPlayer(
      id: '3',
      name: 'Marcus Johnson',
      profileImageUrl: AssetsConstants.image3,
      specialty: 'Backhand Specialist',
      atpRanking: 120,
      isSubscribed: true,
      videosLeft: 5,
    ),
    ProPlayer(
      id: '4',
      name: 'Sofia Rodriguez',
      profileImageUrl: AssetsConstants.image4,
      specialty: 'All-Court Player',
      atpRanking: 89,
      isSubscribed: true,
      videosLeft: 2,
    ),
    ProPlayer(
      id: '5',
      name: 'James Anderson',
      profileImageUrl: AssetsConstants.image5,
      specialty: 'Clay Court Expert',
      atpRanking: 156,
      isSubscribed: false,
    ),
    ProPlayer(
      id: '6',
      name: 'Aria Thompson',
      profileImageUrl: AssetsConstants.image6,
      specialty: 'Mental Training Coach',
      atpRanking: 67,
      isSubscribed: true,
      videosLeft: 8,
    ),
    ProPlayer(
      id: '7',
      name: 'Rafael Santos',
      profileImageUrl: AssetsConstants.image7,
      specialty: 'Drop Shot Master',
      atpRanking: 203,
      isSubscribed: false,
    ),
    ProPlayer(
      id: '8',
      name: 'Victoria Chen',
      profileImageUrl: AssetsConstants.image8,
      specialty: 'Return Specialist',
      atpRanking: 45,
      isSubscribed: true,
      videosLeft: 1,
    ),
    ProPlayer(
      id: '9',
      name: 'Alexander Petrov',
      profileImageUrl: AssetsConstants.image9,
      specialty: 'Power Baseline Player',
      atpRanking: 312,
      isSubscribed: false,
    ),
    ProPlayer(
      id: '10',
      name: 'Maya Patel',
      profileImageUrl: AssetsConstants.image1,
      specialty: 'Doubles Expert',
      atpRanking: 78,
      isSubscribed: true,
      videosLeft: 4,
    ),
  ];
}
