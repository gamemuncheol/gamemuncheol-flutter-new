import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/blur_layout.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_post_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_padding.dart';

class PostFormScreen extends StatefulWidget {
  const PostFormScreen({super.key});

  static const NAME = "POST_FORM_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  @override
  Widget build(BuildContext context) {
    return BlurLayout<BaseState<Post>>(
      provider: uploadPostNotifierProvider,
      scaffold: BottomButtonExpanded(
        appBar: PostSaveFormAppBar.step3(
          onLeadingTap: context.pop,
        ).toPrefferedSize(),
        expanded: SingleChildScrollView(
          child: PostSaveFormPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    PostSaveFormHeader(
                      title: "구체적인 정보를 입력해\n주세요.",
                    ),
                  ],
                ),
                Gap(80.h),
              ],
            ),
          ),
        ),
        bottomButton: Consumer(
          builder: (context, ref, child) {
            return PostSaveFormNextButton(onTap: () {});
          },
        ),
      ),
    );
  }
}
