import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol_upstream/common/component/custom_text_form_filed.dart';
import 'package:gamemuncheol_upstream/common/service/form_validator.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class PostFormTitleField extends StatelessWidget {
  final TextEditingController titleController;

  const PostFormTitleField({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    final GlobalKey titleFieldKey = GlobalKey();

    return CustomTextFormField(
      fieldKey: titleFieldKey,
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      validator: (value) {
        final bool isValid = FormValidator.lengthValidator(value, min: 3);
        return isValid ? null : "제목을 최소 세 글자 이상 입력해 주세요.";
      },
      textEditingController: titleController,
      isUnderLineTextFormField: true,
      maxLength: 40,
      maxLines: 1,
      textStyle:
          context.textStyles.body4R.copyWith(color: context.colors.natural06),
      counterBuilder: (context,
          {required currentLength, required isFocused, required maxLength}) {
        return Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: currentLength.toString(),
                  style: context.textStyles.body5R.copyWith(
                    color: context.colors.primaryBlue,
                  ),
                ),
                TextSpan(
                  text: "/$maxLength",
                  style: context.textStyles.body5R.copyWith(
                    color: context.colors.natural03,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
