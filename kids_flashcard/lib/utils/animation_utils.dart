import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SoundEffects {
  static void playFlipSound() {
    // 카드 뒤집기 효과음
    HapticFeedback.mediumImpact();
  }

  static void playSuccessSound() {
    // 성공 효과음
    HapticFeedback.heavyImpact();
  }
}

class AnimationUtils {
  static Widget bounceAnimation({
    required Widget child,
    required Duration duration,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, _) {
        return Transform.scale(
          scale: 1.0 + 0.1 * Curves.elasticOut.transform(value),
          child: child,
        );
      },
    );
  }

  static Widget shimmerEffect({
    required Widget child,
    required Color shimmerColor,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            shimmerColor.withOpacity(0.5),
            shimmerColor,
            shimmerColor.withOpacity(0.5),
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: const Alignment(-1.0, -0.3),
          end: const Alignment(1.0, 0.3),
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
