import 'package:flutter/material.dart';

import 'components/custom_loading_component.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Navigator.pushReplacementNamed(context, '/home/');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLoadingComponent(),
      ),
    );
  }
}
