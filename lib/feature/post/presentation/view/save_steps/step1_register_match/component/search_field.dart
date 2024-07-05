import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class SearchField extends StatefulWidget {
  final void Function(String) search;
  const SearchField({super.key, required this.search});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController searchController = TextEditingController()
    ..addListener(_onSearchChanged);

  Timer? _debounce;

  final String hintText = "검색어(게임ID)를 입력해 주세요.";

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchController.text.trim().isNotEmpty) {
        widget.search(searchController.text.trim());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: SearchBar(
        controller: searchController,
        surfaceTintColor: WidgetStateProperty.all(
          context.colors.natural02,
        ),
        hintText: hintText,
        hintStyle: WidgetStateProperty.all(
          context.textStyles.body4R.copyWith(
            color: context.colors.natural06,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: SvgPicture.asset(
            AppAsset.SEARCH_ICON_PATH,
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          context.colors.natural02,
        ),
      ),
    );
  }
}
