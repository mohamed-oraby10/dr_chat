import 'package:dr_chat/core/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrChat());
}

class DrChat extends StatelessWidget {
  const DrChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
