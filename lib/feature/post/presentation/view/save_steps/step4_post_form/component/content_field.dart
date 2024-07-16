import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/common/component/custom_text_form_filed.dart';
import 'package:gamemuncheol_upstream/common/service/form_validator.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class PostFormContentField extends StatelessWidget {
  final TextEditingController contentController;
  const PostFormContentField({super.key, required this.contentController});

  @override
  Widget build(BuildContext context) {
    final contentFieldKey = GlobalKey();

    return SizedBox(
      height: 200.h,
      child: CustomTextFormField(
        fieldKey: contentFieldKey,
        onTapOutside: (e) => FocusScope.of(context).unfocus(),
        validator: (value) {
          final bool isValid = FormValidator.lengthValidator(value, min: 3);
          return isValid ? null : "본문을 최소 세 글자 이상 입력해 주세요.";
        },
        textEditingController: contentController,
        isUnderLineTextFormField: false,
        maxLength: 1200,
        maxLines: 300,
        textStyle: context.textStyles.body4R.copyWith(
          color: context.colors.natural06,
        ),
      ),
    );
  }
}
