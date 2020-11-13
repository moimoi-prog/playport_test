import 'package:flutter/material.dart';

class NoMessageWidget extends StatelessWidget {
  final String detail;

  const NoMessageWidget({Key key, this.detail})
      : assert(detail != null)
  , super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return Expanded(
      child: Center(
        child: Text(detail),
      ),
    );
  }
}
