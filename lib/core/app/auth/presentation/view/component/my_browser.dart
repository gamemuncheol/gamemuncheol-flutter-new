import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  final void Function() onClosedCallBack;
  MyChromeSafariBrowser({required this.onClosedCallBack});

  @override
  void onClosed() async => onClosedCallBack();
}