import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class Thumbnail extends StatelessWidget {
  final Uint8List? thumbnailByte;
  final String? thumbnailUrl;

  final VoidCallback? onPreviewTap;

  const Thumbnail(
      {super.key, this.thumbnailByte, this.thumbnailUrl, this.onPreviewTap});

  factory Thumbnail.fromMemory(Uint8List? byte,
      {required VoidCallback onPreviewTap}) {
    return Thumbnail(
      thumbnailByte: byte,
      onPreviewTap: onPreviewTap,
    );
  }

  factory Thumbnail.fromUrl(String? url, {required VoidCallback onPreviewTap}) {
    return Thumbnail(
      thumbnailUrl: url,
      onPreviewTap: onPreviewTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width * 9 / 16,
          child: thumbnailUrl == null && thumbnailByte == null
              ? Image.asset(
                  fit: BoxFit.cover,
                  AppAsset.ZZOL_PLACEHOLDER,
                )
              : thumbnailUrl == null
                  ? Image.memory(
                      fit: BoxFit.cover,
                      thumbnailByte!,
                    )
                  : CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: thumbnailUrl!,
                    ),
        ),
        if (onPreviewTap != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 20.h,
            child: Center(
              child: GestureDetector(
                onTap: onPreviewTap,
                child: Container(
                  color: context.colors.transParent,
                  child: Text(
                    "미리보기",
                    style: context.textStyles.body4M.copyWith(
                      color: context.colors.primaryWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
