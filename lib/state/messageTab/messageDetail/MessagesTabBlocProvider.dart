import 'package:flutter/material.dart';

import 'MessagesTabBloc.dart';

export 'MessagesTabBloc.dart';

class MessagesTabBlocProvider extends InheritedWidget {
  const MessagesTabBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static MessagesTabBloc bloc;

  @override
  bool updateShouldNotify(_) => true;

  static MessagesTabBlocProvider of(BuildContext context) {
    bloc = MessagesTabBloc(context);
    return context.dependOnInheritedWidgetOfExactType<MessagesTabBlocProvider>();
  }
}