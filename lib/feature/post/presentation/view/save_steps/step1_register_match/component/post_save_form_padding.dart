import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostSaveFormPadding extends StatelessWidget {
  final Widget child;
  const PostSaveFormPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16.w,
        36.h,
        16.w,
        0.h,
      ),
      child: child,
    );
  }
}
