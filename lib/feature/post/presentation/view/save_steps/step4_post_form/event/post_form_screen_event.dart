import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/common/layout/home/layout/home_layout.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/post_save_form.dart';
import 'package:gamemuncheol_upstream/feature/post/model/tag.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/search_match_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_post_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/thumbnail_setting_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/screen/post_form_screen.dart';

mixin PostFormScreenEvent on ConsumerState<PostFormScreen> {
  // 폼 키
  GlobalKey<FormState> get formKey;

  // 제목 컨트롤러
  TextEditingController get titleController;

  // 본문 컨트롤러
  TextEditingController get contentController;

  // 태그
  ValueNotifier<List<Tag>> get tags;

  Widget Function(BuildContext, VoidCallback, String) get overLayBuilder;

  void onLeadingTap() {
    context.pop();
  }

  Future<void> preview() async {
    context.pushNamed(
      ThumbnailSettingScreen.NAME,
      extra: await PermissionHandlerService.checkPermission(
        Permission.photos,
      ),
    );
  }

  // 태그 자동완성
  void updateOverlay({
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) {
    if (overlayEntry.value != null) {
      overlayEntry.value?.remove();
    }

    if (tagFieldController.text.trim().isEmpty) {
      overlayEntry.value = null;
      return;
    }

    final RenderBox renderBox =
        tagFieldKey.currentState?.context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    final newOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(0, size.height),
            child: overLayBuilder(
              context,
              onTap,
              tagFieldController.text.trim(),
            ),
          ),
        );
      },
    );

    overlayEntry.value = newOverlay;
    Overlay.of(context).insert(overlayEntry.value!);
  }

  void removeTag({
    required int tagId,
  }) {
    final List<Tag> newTags = List.from(tags.value);

    newTags.remove(tags.value.where((e) => e.id == tagId).first);

    tags.value = newTags;
  }

  void addTag({
    required Tag newTag,
  }) {
    final List<Tag> newTags = List.from(tags.value);

    newTags.add(newTag);

    tags.value = newTags;
  }

  Future<void> post() async {
    await ref
        .read(uploadPostNotifierProvider.notifier)
        .post(
          thumbImageFile:
              ref.read(uploadVideoNotifierProvider).value.thumbnail!,
          form: PostSaveForm(
            videoUrl: ref.read(uploadVideoNotifierProvider).value.videoUrl,
            thumbnailUrl: "",
            title: titleController.text.trim(),
            content: contentController.text.trim(),
            matchUserIds: [
              ref.read(matchSaveFormNotifierProvider).me!.id,
              ref.read(matchSaveFormNotifierProvider).stakeHolder!.id,
            ],
            tags: tags.value.isEmpty
                ? []
                : tags.value.map((e) => e.content).toList(),
          ),
        )
        .then((_) {
      if (ref.read(uploadPostNotifierProvider) is Value) {
        ref.refresh(matchSaveFormNotifierProvider);
        ref.refresh(searchMatchNotifierProvider);
        ref.refresh(uploadVideoNotifierProvider);
        ref.refresh(uploadPostNotifierProvider);

        context.go(HomeLayout.PATH);
      }
    });
  }
}
