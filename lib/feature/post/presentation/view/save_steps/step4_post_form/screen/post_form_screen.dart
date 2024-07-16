import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/blur_layout.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/tag.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_post_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_padding.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/component/content_field.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/component/tag_field.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/component/title_field.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/event/post_form_screen_event.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/thumbnail.dart';

class PostFormScreen extends ConsumerStatefulWidget {
  const PostFormScreen({super.key});

  static const NAME = "POST_FORM_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  ConsumerState<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends ConsumerState<PostFormScreen>
    with PostFormScreenEvent {
  @override
  late final formKey = GlobalKey<FormState>();

  @override
  late final titleController = TextEditingController();

  @override
  late final contentController = TextEditingController();

  @override
  late final ValueNotifier<List<Tag>> tags = ValueNotifier([]);

  @override
  Widget Function(BuildContext, VoidCallback, String) overLayBuilder =
      (context, onTap, tag) {
    return Material(
      elevation: 3.5,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: context.colors.primaryWhite,
          child: Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Text(
              tag,
              style: context.textStyles.body4R.copyWith(
                color: context.colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  };

  bool isCheckingPermission = false;

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    tags.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(uploadPostNotifierProvider, (pre, next) {
      if (next.isError && next.error.message.isNotEmpty) {
        Fluttertoast.showToast(msg: next.error.message);
      }
    });

    return BlurLayout<BaseState<void>>(
      provider: uploadPostNotifierProvider,
      scaffold: BottomButtonExpanded(
        appBar: PostSaveFormAppBar.step4(
          onLeadingTap: onLeadingTap,
        ).toPrefferedSize(),
        expanded: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: PostSaveFormPadding(
            child: Column(
              children: [
                const Row(
                  children: [
                    PostSaveFormHeader(
                      title: "구체적인 정보를 입력해\n주세요.",
                    ),
                  ],
                ),
                Gap(10.h),
                Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(uploadVideoNotifierProvider).when(
                      value: (value) {
                        return Center(
                          child: Thumbnail.fromMemory(
                            value.thumbnail,
                            size: Size(240.w, 134.h),
                            onPreviewTap: () async {
                              if (isCheckingPermission) {
                                return;
                              }

                              await preview();
                              isCheckingPermission = false;
                            },
                          ),
                        );
                      },
                      orElse: () {
                        return const SizedBox();
                      },
                    );
                  },
                ),
                Gap(50.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAsset.TITLE,
                    ),
                    Gap(12.w),
                    const Text(
                      "제목",
                    ),
                  ],
                ),
                PostFormTitleField(
                  titleController: titleController,
                ),
                Gap(60.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAsset.CONTENTS,
                    ),
                    Gap(12.w),
                    const Text(
                      "내용",
                    ),
                  ],
                ),
                Gap(20.h),
                PostFormContentField(
                  contentController: contentController,
                ),
                Gap(60.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAsset.TAGS,
                    ),
                    Gap(12.w),
                    const Text(
                      "태그",
                    ),
                  ],
                ),
                Gap(20.h),
                PostFormTagField(
                  tags: tags,
                  addTag: addTag,
                  removeTag: removeTag,
                  updateOverlay: updateOverlay,
                ),
                Gap(120.h),
              ],
            ),
          ),
        ),
        bottomButton: Consumer(
          builder: (context, ref, child) {
            return PostSaveFormNextButton(
              onTap: () async => post(),
            );
          },
        ),
      ),
    );
  }
}
