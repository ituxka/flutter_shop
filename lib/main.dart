import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Env.dev);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
