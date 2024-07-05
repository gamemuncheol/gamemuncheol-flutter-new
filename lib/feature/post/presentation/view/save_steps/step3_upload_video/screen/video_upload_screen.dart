import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/component/icon_button_rounded.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/blur_layout.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/video_upload_form.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_padding.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/event/video_upload_screen_event.dart';

class VideoUploadScreen extends ConsumerStatefulWidget {
  const VideoUploadScreen({super.key});

  static const NAME = "VIDEO_UPLOAD_SCREEN";
  static final PATH = NAME.toLowerCase();

  @override
  ConsumerState<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends ConsumerState<VideoUploadScreen>
    with VideoUploadScreenEvent {
  final ValueNotifier<bool> fromGallery = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return BlurLayout<BaseState<VideoUploadForm>>(
      provider: uploadVideoNotifierProvider,
      scaffold: BottomButtonExpanded(
        appBar: PostSaveFormAppBar.step3(
          onLeadingTap: context.pop,
        ).toPrefferedSize(),
        expanded: PostSaveFormPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PostSaveFormHeader(
                title: "플레이한 영상을 업로드\n해 주세요.",
              ),
              Gap(80.h),
              ValueListenableBuilder(
                valueListenable: fromGallery,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      IconButtonRounded(
                        onTap: () {
                          fromGallery.value = true;
                        },
                        selected: value,
                        label: "갤러리, 카메라 업로드",
                        iconPath:
                            value ? AppAsset.GALLER_ON : AppAsset.GALLERY_OFF,
                      ),
                      Gap(16.h),
                      IconButtonRounded(
                        onTap: () {
                          fromGallery.value = false;
                        },
                        selected: !value,
                        label: "유튜브 url 업로드",
                        iconPath:
                            value ? AppAsset.YOUTUBE_OFF : AppAsset.YOUTUBE_ON,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        bottomButton: _buildNextBtn(),
      ),
    );
  }

  Widget _buildNextBtn() {
    return Consumer(
      builder: (context, ref, child) {
        return PostSaveFormNextButton(onTap: () {
          if (fromGallery.value) {
            uploadVideo();
          }
          // context.pushNamed(SelectStakeHolderScreen.NAME);
        });
        // if (ref.watch(matchSaveFormNotifierProvider).me != null) {
        //   return PostSaveFormNextBtn(onTap: () {
        //     context.push(SelectStakeHolderScreen.PATH);
        //   });
        // }

        // return PostSaveFormNextBtn.disAble();
      },
    );
  }
}
