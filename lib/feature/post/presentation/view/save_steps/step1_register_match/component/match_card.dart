import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/util/time_formatter.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';

class MatchCard extends ConsumerWidget {
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
        _ChampionThumbnail(championThumbnail: matchUser.championThumbnail),
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
                    _CreatedAt(gameCreation: gameCreation!),
                    Gap(4.h),
                  ],
                ),
              UserInfo(matchUser: matchUser),
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
            child: MatchResult(matchUser: matchUser),
          ),
      ],
    );
  }
}

class _ChampionThumbnail extends StatelessWidget {
  final String championThumbnail;

  const _ChampionThumbnail({
    required this.championThumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w * 2,
      height: 20.w * 2,
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: championThumbnail,
        ),
      ),
    );
  }
}

class _CreatedAt extends StatelessWidget {
  final String gameCreation;

  const _CreatedAt({
    required this.gameCreation,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TimeFormatter.formatToDot(gameCreation),
      style: context.textStyles.cap1.copyWith(
        color: context.colors.natural05,
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final MatchUser matchUser;

  const UserInfo({
    super.key,
    required this.matchUser,
  });

  @override
  Widget build(BuildContext context) {
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
          style: context.textStyles.body5R,
        ),
        const Text(" / "),
        Expanded(
          child: Text(
            championName,
            style: context.textStyles.body5R,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class MatchResult extends StatelessWidget {
  final MatchUser matchUser;

  const MatchResult({
    super.key,
    required this.matchUser,
  });

  @override
  Widget build(BuildContext context) {
    final isWinner = matchUser.win;

    return Container(
      width: 55.w,
      height: 25.h,
      decoration: BoxDecoration(
        color:
            isWinner ? context.colors.primaryBlue : context.colors.background,
        borderRadius: BorderRadius.circular(64),
        border: Border.all(
          color: isWinner
              ? context.colors.primaryBlue
              : context.colors.primaryGreen,
        ),
      ),
      child: Center(
        child: Text(
          isWinner ? "승리" : "패배",
          style: context.textStyles.body5M.copyWith(
            color: isWinner
                ? context.colors.onPrimaryBlue
                : context.colors.primaryGreen,
          ),
        ),
      ),
    );
  }
}
