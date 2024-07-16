import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/component/custom_text_form_filed.dart';
import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/component/error_text.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/event/youtube_url_upload_screen_event.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/thumbnail.dart';

class YoutubeUrlUploadScreen extends ConsumerStatefulWidget {
  const YoutubeUrlUploadScreen({super.key});

  static const NAME = "YOUTUBE_URL_UPLOAD_SCREEN";
  static final PATH = NAME.toLowerCase();

  @override
  ConsumerState<YoutubeUrlUploadScreen> createState() =>
      _YoutubeUrlUploadScreenState();
}

class _YoutubeUrlUploadScreenState extends ConsumerState<YoutubeUrlUploadScreen>
    with YoutubeUrlUploadScreenEvent {
  @override
  late final TextEditingController searchController = TextEditingController()
    ..addListener(onSearchChanged);

  Timer? _debounce;
  bool isCheckingPermission = false;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchController.text.trim().isNotEmpty) {
        search();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomButtonExpanded(
      appBar: PostSaveFormAppBar.step3(
        onLeadingTap: onLeadingTap,
      ).toPrefferedSize(),
      expanded: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                0,
              ),
              child: const PostSaveFormHeader(
                title: "업로드할 유튜브 영상의\nurl을 입력해 주세요.",
              ),
            ),
            Gap(80.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: CustomTextFormField(
                textEditingController: searchController,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                isUnderLineTextFormField: true,
                hintText: "유튜브 url을 입력해 주세요.",
                maxLines: 1,
              ),
            ),
            Gap(15.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: const ErrorText(),
            ),
            Gap(40.h),
            Consumer(
              builder: (context, ref, child) {
                return ref.watch(uploadVideoNotifierProvider).when(
                  loading: () {
                    return const Center(
                      child: LoadingIndicator(),
                    );
                  },
                  value: (value) {
                    return Thumbnail.fromMemory(
                      value.thumbnail,
                      onPreviewTap: () async {
                        if (isCheckingPermission) {
                          return;
                        }

                        await preview();
                        isCheckingPermission = false;
                      },
                    );
                  },
                  orElse: () {
                    return const SizedBox();
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomButton: Consumer(
        builder: (context, ref, child) {
          return ref.watch(uploadVideoNotifierProvider).when(
                value: (value) => PostSaveFormNextButton(
                  onTap: post,
                ),
                orElse: () => PostSaveFormNextButton.disAble(),
              );
        },
      ),
    );
  }
}
