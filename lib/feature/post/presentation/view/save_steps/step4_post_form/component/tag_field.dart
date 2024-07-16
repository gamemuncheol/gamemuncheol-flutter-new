import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/component/custom_text_form_filed.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/model/tag.dart';

class PostFormTagField extends StatefulWidget {
  final ValueNotifier<List<Tag>> tags;

  final void Function({
    required Tag newTag,
  }) addTag;

  final void Function({
    required int tagId,
  }) removeTag;

  final void Function({
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) updateOverlay;

  const PostFormTagField({
    super.key,
    required this.tags,
    required this.addTag,
    required this.removeTag,
    required this.updateOverlay,
  });

  @override
  FeedTagState createState() => FeedTagState();
}

class FeedTagState extends State<PostFormTagField> with ThemeProvider {
  late GlobalKey tagFieldKey;
  late TextEditingController tagFieldController;

  final LayerLink layerLink = LayerLink();
  final ValueNotifier<OverlayEntry?> overlayEntry =
      ValueNotifier<OverlayEntry?>(null);

  @override
  void initState() {
    super.initState();
    tagFieldKey = GlobalKey();
    tagFieldController = TextEditingController();
    tagFieldController.addListener(updateOverlay);
  }

  @override
  void dispose() {
    tagFieldController.removeListener(updateOverlay);
    tagFieldController.dispose();
    overlayEntry.value?.remove();
    overlayEntry.dispose();
    super.dispose();
  }

  void updateOverlay() {
    widget.updateOverlay(
      layerLink: layerLink,
      tagFieldKey: tagFieldKey,
      overlayEntry: overlayEntry,
      tagFieldController: tagFieldController,
      onTap: () {
        final currentContent = tagFieldController.text.trim();

        final isDuplicated = widget.tags.value
                .where((e) => e.content == currentContent)
                .firstOrNull !=
            null;

        if (isDuplicated) {
          removeOverlay();
          return;
        }

        final int id =
            widget.tags.value.isEmpty ? 1 : widget.tags.value.last.id + 1;

        widget.addTag(
          newTag: Tag(
            id: id,
            content: tagFieldController.text.trim(),
          ),
        );

        removeOverlay();
      },
    );
  }

  void removeOverlay() {
    overlayEntry.value?.remove();
    overlayEntry.value = null;
    tagFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CompositedTransformTarget(
                    link: layerLink,
                    child: Focus(
                      onFocusChange: (value) {
                        if (!value) {
                          overlayEntry.value?.remove();
                          overlayEntry.value = null;
                        }
                      },
                      child: _TagField(
                        tagFieldKey: tagFieldKey,
                        tagController: tagFieldController,
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: widget.tags,
                    builder: (context, value, child) {
                      return Visibility(
                        visible: widget.tags.value.isNotEmpty,
                        child: _SelectedTag(
                          removeTag: widget.removeTag,
                          tags: widget.tags,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TagField extends StatelessWidget {
  final GlobalKey tagFieldKey;
  final TextEditingController tagController;

  const _TagField({
    required this.tagFieldKey,
    required this.tagController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      fieldKey: tagFieldKey,
      textEditingController: tagController,
      maxLines: 1,
      inputDeco: InputDecoration(
        border: InputBorder.none,
        hintText: "태그를 입력해 주세요.",
        fillColor: context.colors.natural02,
        filled: true,
      ),
    );
  }
}

class _SelectedTag extends StatelessWidget {
  final void Function({required int tagId}) removeTag;
  final ValueNotifier<List<Tag>> tags;

  const _SelectedTag({
    required this.tags,
    required this.removeTag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: tags.value
                .map((tag) {
                  return GestureDetector(
                    onTap: () => removeTag(
                      tagId: tag.id,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 16.w,
                        top: 24.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.colors.primaryBlue,
                        ),
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag.content,
                            style: context.textStyles.body4R.copyWith(
                              color: context.colors.primaryBlue,
                            ),
                          ),
                          Gap(10.w),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: context.colors.primaryBlue,
                            child: SvgPicture.asset(
                              AppAsset.CLOSE_WHITE,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
                .toSet()
                .toList(),
          ),
        ],
      ),
    );
  }
}
