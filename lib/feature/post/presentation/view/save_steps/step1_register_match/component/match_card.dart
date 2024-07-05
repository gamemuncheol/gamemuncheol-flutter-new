import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/common/util/time_formatter.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';

class MatchCard extends ConsumerWidget with ThemeProvider {
  final MatchUser matchUser;
  final String? gameCreation;

  const MatchCard({
    super.key,
    required this.matchUser,
    this.gameCreation,
  });

  factory MatchCard.fullInfo({
    required MatchUser matchUser,
    required String gameCreation,
  }) {
    return MatchCard(matchUser: matchUser, gameCreation: gameCreation);
  }

  factory MatchCard.partOnly({
    required MatchUser matchUser,
  }) {
    return MatchCard(matchUser: matchUser);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFullInfo = gameCreation != null;

    return Row(
      children: [
        /**
         * 챔피언 썸네일
         */
        _buildChamPionThumbNail(),
        Gap(10.w),
        /**
         * 유저 정보
         */
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isFullInfo)
                Column(
                  children: [
                    _buildCreatedAt(),
                    Gap(4.h),
                  ],
                ),
              _buildUserInfo(),
            ],
          ),
        ),
        /**
         * 매치 결과, 승리/패배
         */
        if (isFullInfo)
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
            ),
            child: _buildResult(),
          ),
      ],
    );
  }

  Widget _buildChamPionThumbNail() {
    return SizedBox(
      width: 20.w * 2,
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: matchUser.championThumbnail,
        ),
      ),
    );
  }

  Widget _buildCreatedAt() {
    return Text(
      TimeFormatter.formatToDot(
        gameCreation!,
      ),
      style: textStyles.cap1.copyWith(
        color: colors.natural05,
      ),
    );
  }

  Widget _buildUserInfo() {
    // 챔피언 이름
    final championName = matchUser.championName;

    // 유저 닉네임
    final nickname = matchUser.nickname.split("#").first.trim();
    // 8글자 까지만 표시
    final displayName =
        nickname.length > 8 ? '${nickname.substring(0, 8)}...' : nickname;

    return Row(
      children: [
        Text(
          displayName,
          style: textStyles.body5R,
        ),
        const Text(" / "),
        Expanded(
          child: Text(
            championName,
            style: textStyles.body5R,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    final isWinner = matchUser.win;

    final boxDecoration = BoxDecoration(
      color: isWinner ? colors.primaryBlue : colors.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
          color: isWinner ? colors.primaryBlue : colors.primaryGreen),
    );

    final result = isWinner ? "승리" : "패배";
    final resultStyle = textStyles.body5M
        .copyWith(color: isWinner ? colors.onPrimaryBlue : colors.primaryGreen);

    return Container(
      width: 55.w,
      height: 25.h,
      decoration: boxDecoration,
      child: Center(
        child: Text(
          result,
          style: resultStyle,
        ),
      ),
    );
  }
}
