class UserProfile {
  final String? description;
  final int vipType;
  final int djStatus;
  final Map experts;
  final int city;
  final String avatarUrl;
  final bool defaultAvatar;
  final int province;
  final int backgroundImgId;
  final bool mutual;
  final String? remarkName;
  final Map? expertTags;
  final int authStatus;
  final int avatarImgId;
  final int gender;
  final int accountStatus;
  final bool followed;
  final String backgroundUrl;
  final String detailDescription;
  final String avatarImgIdStr;
  final String backgroundImgIdStr;
  final int userId;
  final int userType;
  final int birthday;
  final String nickname;
  final String signature;
  final int authority;
  final int followeds;
  final int follows;
  final int eventCount;
  final avatarDetail;
  final int playlistCount;
  final int playlistBeSubscribedCount;

  UserProfile({
    this.description,
    required this.vipType,
    required this.djStatus,
    required this.experts,
    required this.city,
    required this.avatarUrl,
    required this.defaultAvatar,
    required this.province,
    required this.backgroundImgId,
    required this.mutual,
    this.remarkName,
    this.expertTags,
    required this.authStatus,
    required this.avatarImgId,
    required this.gender,
    required this.accountStatus,
    required this.followed,
    required this.backgroundUrl,
    required this.detailDescription,
    required this.avatarImgIdStr,
    required this.backgroundImgIdStr,
    required this.userId,
    required this.userType,
    required this.birthday,
    required this.nickname,
    required this.signature,
    required this.authority,
    required this.followeds,
    required this.follows,
    required this.eventCount,
    this.avatarDetail,
    required this.playlistCount,
    required this.playlistBeSubscribedCount,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      vipType: json['vipType'],
      djStatus: json['djStatus'],
      experts: json['experts'],
      city: json['city'],
      avatarUrl: json['avatarUrl'],
      defaultAvatar: json['defaultAvatar'],
      province: json['province'],
      backgroundImgId: json['backgroundImgId'],
      mutual: json['mutual'],
      authStatus: json['authStatus'],
      avatarImgId: json['avatarImgId'],
      gender: json['gender'],
      accountStatus: json['accountStatus'],
      followed: json['followed'],
      backgroundUrl: json['backgroundUrl'],
      detailDescription: json['detailDescription'],
      avatarImgIdStr: json['avatarImgIdStr'],
      backgroundImgIdStr: json['backgroundImgIdStr'],
      userId: json['userId'],
      userType: json['userType'],
      birthday: json['birthday'],
      nickname: json['nickname'],
      signature: json['signature'],
      authority: json['authority'],
      followeds: json['followeds'],
      follows: json['follows'],
      eventCount: json['eventCount'],
      playlistCount: json['playlistCount'],
      playlistBeSubscribedCount: json['playlistBeSubscribedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vipType': vipType,
      'djStatus': djStatus,
      'experts': experts,
      'city': city,
      'avatarUrl': avatarUrl,
      'defaultAvatar': defaultAvatar,
      'province': province,
      'backgroundImgId': backgroundImgId,
      'mutual': mutual,
      'authStatus': authStatus,
      'avatarImgId': avatarImgId,
      'gender': gender,
      'accountStatus': accountStatus,
      'followed': followed,
      'backgroundUrl': backgroundUrl,
      'detailDescription': detailDescription,
      'avatarImgIdStr': avatarImgIdStr,
      'backgroundImgIdStr': backgroundImgIdStr,
      'userId': userId,
      'userType': userType,
      'birthday': birthday,
      'nickname': nickname,
      'signature': signature,
      'authority': authority,
      'followeds': followeds,
      'follows': follows,
      'eventCount': eventCount,
      'playlistCount': playlistCount,
      'playlistBeSubscribedCount': playlistBeSubscribedCount,
    };
  }
}

final testAccount = {
  'description': '',
  'vipType': 11,
  'djStatus': 0,
  'experts': {},
  'city': 440500,
  'avatarUrl':
      'https://p3.music.126.net/gPhq8z1ilHWc1gT7Dx8ZdQ==/3247957352284722.jpg',
  'defaultAvatar': false,
  'province': 440000,
  'backgroundImgId': 3312828537064497,
  'mutual': false,
  'remarkName': null,
  'expertTags': null,
  'authStatus': 0,
  'avatarImgId': 3247957352284722,
  'gender': 1,
  'accountStatus': 0,
  'followed': false,
  'backgroundUrl':
      'https://p4.music.126.net/iK1rkqH7bWMenZlKFUoQPw==/3312828537064497.jpg',
  'detailDescription': '',
  'avatarImgIdStr': 3247957352284722,
  'backgroundImgIdStr': 3312828537064497,
  'userId': 113167486,
  'userType': 0,
  'birthday': 725817600000,
  'nickname': '比比34',
  'signature': '生活无完美，曲折亦风景',
  'authority': 0,
  'followeds': 10,
  'follows': 10,
  'eventCount': 3,
  'avatarDetail': null,
  'playlistCount': 7,
  'playlistBeSubscribedCount': 0
};
