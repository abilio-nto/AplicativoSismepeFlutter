import 'package:flutter/widgets.dart';

class LoginState extends InheritedWidget {
  final ValueNotifier<bool> isLoggedIn;

  LoginState({required this.isLoggedIn, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(LoginState oldWidget) {
    return isLoggedIn != oldWidget.isLoggedIn;
  }

  static LoginState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginState>()!;
  }
}
