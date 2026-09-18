import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/spinner-three-dots.json',
      width: 40,
      height: 40,
      fit: BoxFit.fill,
    );
  }
}
